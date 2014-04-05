(load "./o+.scm")
(load "./omultiply.scm")
(load "./oexpt.scm")
(load "./operator.scm")

(define atom-to-function
  (lambda (x)
    (cond
      ((eq? x (quote o+)) o+)
      ((eq? x (quote omultiply)) omultiply)
      (else oexpt))))


; > (atom-to-function (operator `(+ 5 3)))
; #<procedure:oexpt>
