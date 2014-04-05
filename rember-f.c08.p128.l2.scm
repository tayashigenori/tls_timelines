(load "./oequal.scm")

(define rember-f
  (lambda (test? a l)
    (cond
      ((null? l) (quote ()))
      ((test? (car l) a) (cdr l))
      (else (cons (car l)
                  (rember-f test? a
                            (cdr l)))))))


; > (rember-f = 5 `(6 2 5 3))
; (6 2 3)
; > (rember-f eq? `jelly `(jelly beans are good))
; (beans are good)
; > (rember-f oequal? `(pop corn) `(lemonade (pop corn) and (cake)))
; (lemonade and (cake))
