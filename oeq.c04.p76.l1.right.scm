(load "./common/sub1.scm")
(load "./ogt.scm")
(load "./olt.scm")

(define oeq
  (lambda (n m)
    (cond
      ((ogt n m) #f)
      ((olt n m) #f)
      (else #t))))
