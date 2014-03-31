(load "./common/atom.scm")

(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) ... )
      ((eq? (car (cdr nexp)) (quote o+))
       ...)
      ((eq? (car (cdr nexp)) (quote omultiply))
       ...)
      (else ...))))


; stub

; > (value 13)
; 13
; > (value `(1 o+ 3))
; 4
; > (value `(1 o+ (3 oexpt 4)))
; 82
; > (value `(1 o+ (3 omultiply 4)))
; 13
