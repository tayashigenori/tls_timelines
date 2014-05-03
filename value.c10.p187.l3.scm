(load "./common/atom.scm")
(load "./build.scm")
(load "./first.scm")
(load "./second.scm")
(load "./third.scm")

(define new-entry build)

(define lookup-in-entry
  (lambda (name entry entry-f)
    (lookup-in-entry-help name
                          (first entry)
                          (second entry)
                          entry-f)))

(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond
      ((null? names) (entry-f name))
      ((eq? (car names) name)
       (car values))
      (else (lookup-in-entry-help name
                                  (cdr names)
                                  (cdr values)
                                  entry-f)))))


; > (lookup-in-entry `entree `((appetizer entree beverage) (food tastes good)) first) ; "first" not used
; tastes

(define extend-table cons)

(define lookup-in-table
  (lambda (name table table-f)
    (cond
      ((null? table) (table-f name))
      (else (lookup-in-entry name
                             (car table)
                             (lambda (name)
                               (lookup-in-table name
                                                (cdr table)
                                                table-f)))))))


; > (lookup-in-table `entree `(((entree dessert)
;                               (spaghetti spumoni))
;                              ((appetizer entree beverage)
;                               (food tastes good)))
;                    first) ; "first" not used
; spaghetti

(define expression-to-action
  (lambda (e)
    (cond
      ((atom? e) (atom-to-action e))
      (else (list-to-action e)))))

(define atom-to-action
  (lambda (e)
    (cond
      ((number? e) *const)
      ((eq? e #t) *const)
      ((eq? e #f) *const)
      ((eq? e (quote cons)) *const)
      ((eq? e (quote car)) *const)
      ((eq? e (quote cdr)) *const)
      ((eq? e (quote null?)) *const)
      ((eq? e (quote eq?)) *const)
      ((eq? e (quote atom?)) *const)
      ((eq? e (quote zero?)) *const)
      ((eq? e (quote add1?)) *const)
      ((eq? e (quote sub1?)) *const)
      ((eq? e (quote number?)) *const)
      (else *identifier))))

(define list-to-action
  (lambda (e)
    (cond
      ((atom? (car e))
       (cond
         ((eq? (car e) (quote quote))
          *quote)
         ((eq? (car e) (quote lambda))
          *lambda)
         ((eq? (car e) (quote cond))
          *cond)
         (else *application)))
      (else *application))))

; expression-to-action doesn't work yet

(define value
  (lambda (e)
    (meaning e (quote ()))))

(define meaning
  (lambda (e table)
    ((expression-to-action e) e table)))

; > (value `(car (quote (a b c)))) ;; expecting a
; reference to undefined identifier: *application

; > (value `(quote (car (quote (a b c)))))
; (car '(a b c))

; > (value `(add1 6)) ;; expecting 7
; reference to undefined identifier: *application

; > (value 6)
; 6

; > (value `(quote nothing))
; nothing

; > (value `nothing) ;; does not have value
; mcar: expects argument of type <mutable-pair>; given ()

; > (value `((lambda (nothing)
;              (cons nothing (quote ())))
;            (quote
;             (from nothing comes something))))
;; expecting ((from nothing comes something))
; reference to undefined identifier: *application

; > (value `((lambda (nothing)
;              (cond
;                (nothing (quote something))
;                (else (quote nothing))))
;            #t))
;; expecting something
; reference to undefined identifier: *application

; > (value #f)
; #f

; > (value `car)
; (primitive car)

(define *const
  (lambda (e table)
    (cond
      ((number? e) e)
      ((eq? e #t) #t)
      ((eq? e #f) #f)
      (else (build (quote primitive) e)))))


; > (*const 1 `())
; 1
; > (*const #t `())
; #t
; > (*const #f `())
; #f
; > (*const `car `())
; (primitive car)

(define *quote
  (lambda (e table)
    (text-of e)))

(define text-of second)

; > (*quote `(quote quoted_text) `())
; quoted_text

(define *identifier
  (lambda (e table)
    (lookup-in-table e table initial-table)))

(define initial-table
  (lambda (name)
    (car (quote ()))))

; > (*identifier `x `(((x y z) (1 2 3))
;                     ((a b c) (4 5 6))))
; 1

(define *lambda
  (lambda (e table)
    (build (quote non-primitive)
           (cons table (cdr e)))))

(define table-of first)
(define formals-of second)
(define body-of third)

(define evcon
  (lambda (lines table)
    (cond
      ((else? (question-of (car lines)))
       (meaning (answer-of (car lines))
                table))
      ((meaning (question-of (car lines))
                table)
       (meaning (answer-of (car lines))
                table))
      (else (evcon (cdr lines) table)))))

(define else?
  (lambda (x)
    (cond
      ((atom? x) (eq? x (quote else)))
      (else #f))))

(define question-of first)
(define answer-of second)

(define *cond
  (lambda (e table)
    (evcon (cond-lines-of e) table)))

(define cond-lines-of cdr)

; > (*cond `(cond (coffee klatsch) (t party)) `(((coffee) (t))
;                                               ((klatsch party) (5 (6)))))
; 5
