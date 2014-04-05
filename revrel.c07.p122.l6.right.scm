(load "./build.scm")
(load "./first.scm")
(load "./second.scm")

(define revrel
  (lambda (rel)
    (cond
      ((null? rel) (quote ()))
      (else (cons (build
                   (second (car rel))
                   (first (car rel)))
                  (revrel (cdr rel)))))))


; > (revrel `((8 a) (pumpkin pie) (got sick)))
; ((a 8) (pie pumpkin) (sick got))
