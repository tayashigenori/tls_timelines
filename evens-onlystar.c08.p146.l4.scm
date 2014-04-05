(load "./common/atom.scm")
(load "./oeven.scm")

(define evens-only*
  (lambda (l)
    (cond
      ((null? l) (quote ()))
      ((atom? (car l))
       (cond
         ((oeven? (car l))
          (cons (car l)
                (evens-only* (cdr l))))
         (else (evens-only* (cdr l)))))
      (else (cons (evens-only* (car l))
                  (evens-only* (cdr l)))))))


; > (evens-only* `((9 1 2 8) 3 10 ((9 9) 7 6) 2))
; ((2 8) 10 (() 6) 2)
