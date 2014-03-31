(load "./common/add1.scm")
(load "./common/sub1.scm")

(define o-
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (sub1 (o- n (sub1 m)))))))
