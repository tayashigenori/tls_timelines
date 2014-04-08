(load "./common/atom.scm")
(load "./first.scm")
(load "./second.scm")
(load "./o+.scm")
(load "./omultiply.scm")

; cf: length*
(define weight*
  (lambda (pora)
    (cond
      ((atom? pora) 1)
      (else
       (o+ (omultiply (weight* (first pora)) 2)
           (weight* (second pora)))))))


; > (weight* `((a b) c))
; 7
; > (weight* `(a (b c)))
; 5
