(load "./common/sub1.scm")

(define oeq
  (lambda (n m)
    (cond
      ((zero? m) (zero? n))
      ((zero? n) #f)
      (else (oeq (sub1 n) (sub1 m))))))
