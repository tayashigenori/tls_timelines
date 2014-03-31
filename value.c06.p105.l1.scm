(load "./common/atom.scm")
(load "./o+.scm")
(load "./omultiply.scm")
(load "./oexpt.scm")

(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (car (cdr nexp)) (quote o+))
       (o+ (value (car nexp))
           (value (car (cdr (cdr nexp))))))
      ((eq? (car (cdr nexp)) (quote omultiply))
       (omultiply (value (car nexp))
                  (value (car (cdr (cdr nexp))))))
      (else
       (oexpt (value (car nexp))
              (value (car (cdr (cdr nexp)))))))))


; > (value 13)
; 13
; > (value `(1 o+ 3))
; 4
; > (value `(1 o+ (3 oexpt 4)))
; 82
; > (value `(1 o+ (3 omultiply 4)))
; 13
