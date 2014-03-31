(load "./common/sub1.scm")

(define olt
  (lambda (n m)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else (olt (sub1 n) (sub1 m))))))
