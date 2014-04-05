(load "./revpair.scm")

(define revrel
  (lambda (rel)
    (cond
      ((null? rel) (quote ()))
      (else (cons (revpair (car rel))
                  (revrel (cdr rel)))))))


; > (revrel `((8 a) (pumpkin pie) (got sick)))
; ((a 8) (pie pumpkin) (sick got))
