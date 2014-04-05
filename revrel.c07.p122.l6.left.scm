(define revrel
  (lambda (rel)
    (cond
      ((null? rel) (quote ()))
      (else (cons (cons
                   (car (cdr (car rel)))
                   (cons (car (car rel))
                         (quote ())))
                  (revrel (cdr rel)))))))


; > (revrel `((8 a) (pumpkin pie) (got sick)))
; ((a 8) (pie pumpkin) (sick got))
