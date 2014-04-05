(load "./oeq.scm")
(load "./omultiply.scm")
(load "./oquotient.scm")

(define oeven?
  (lambda (n)
    (oeq (omultiply (oquotient n 2) 2) n)))


; > (oeven? 2048)
; #t
