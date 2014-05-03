(load "./common/atom.scm")
(load "./1st-sub-exp.scm")
(load "./2nd-sub-exp.scm")
(load "./operator.scm")
(load "./atom-to-function.scm")

(load "./build.scm")

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

