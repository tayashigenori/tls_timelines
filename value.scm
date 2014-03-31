(load "./common/atom.scm")
(load "./o+.scm")
(load "./omultiply.scm")
(load "./oexpt.scm")
(load "./1st-sub-exp.scm")
(load "./2nd-sub-exp.scm")
(load "./operator.scm")

(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (operator nexp) (quote o+))
       (o+ (value (1st-sub-exp nexp))
           (value (2nd-sub-exp nexp))))
      ((eq? (operator nexp) (quote omultiply))
       (omultiply (value (1st-sub-exp nexp))
                  (value (2nd-sub-exp nexp))))
      (else
       (oexpt (value (1st-sub-exp nexp))
              (value (2nd-sub-exp nexp)))))))


; > (value 13)
; 13
; > (value `(1 o+ 3))
; 4
; > (value `(1 o+ (3 oexpt 4)))
; 82
; > (value `(1 o+ (3 omultiply 4)))
; 13
