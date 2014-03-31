(load "./oeq.scm")

(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2))
       (oeq a1 a2))
      ((or (number? a1) (number? a2))
       #f)
      (else (eq? a1 a2)))))
