(load "./common/atom.scm")
(load "./o+.scm")
(load "./omultiply.scm")
(load "./oexpt.scm")

(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (car nexp) (quote o+))
       (o+ (value (cdr nexp))
           (value (cdr (cdr nexp)))))
      ((eq? (car nexp) (quote omultiply))
       (omultiply (value (cdr nexp))
                  (value (cdr (cdr nexp)))))
      (else
       (oexpt (value (cdr nexp))
              (value (cdr (cdr nexp))))))))


; > (value `(o+ 1 3))
; returns error "mcar: expects argument of type <mutable-pair>; given ()"
