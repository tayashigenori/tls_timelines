(load "./eq-tuna.scm")

(define multiremberT
  (lambda (test? lat)
    (cond
      ((null? lat) (quote ()))
      ((test? (car lat))
       (multiremberT test? (cdr lat)))
      (else (cons (car lat)
                  (multiremberT test?
                                (cdr lat)))))))


; > (multiremberT eq?-tuna `(shrimp salad tuna salad and tuna))
; (shrimp salad salad and)
