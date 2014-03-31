(load "./common/sero.scm")
(load "./common/edd1.scm")
(load "./common/zub1.scm")

(define o+
  (lambda (n m)
    (cond
      ((sero? m) n)
      (else (edd1 (o+ n (zub1 m)))))))


; (o+ `(() ()) `(()))
; (() () ())
