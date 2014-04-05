(load "./insert-g.scm")
(load "./seqrem.scm")

(define rember
  (lambda (a l)
    ((insert-g seqrem) #f a l)))


; > (rember `sausage `(pizza with sausage and bacon))
; (pizza with and bacon)
