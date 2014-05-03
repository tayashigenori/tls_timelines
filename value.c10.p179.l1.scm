(load "./common/atom.scm")
(load "./1st-sub-exp.scm")
(load "./2nd-sub-exp.scm")
(load "./operator.scm")
(load "./atom-to-function.scm")

(load "./build.scm")
(load "./first.scm")
(load "./second.scm")

(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      (else
       ((atom-to-function
         (operator nexp))
        (value (1st-sub-exp nexp))
        (value (2nd-sub-exp nexp)))))))


; > (value 13)
; 13
; > (value `(1 o+ 3))
; 4
; > (value `(1 o+ (3 oexpt 4)))
; 82
; > (value `(1 o+ (3 omultiply 4)))
; 13

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
