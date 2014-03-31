(load "./common/sub1.scm")

(define ogt
  (lambda (n m)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else (ogt (sub1 n) (sub1 m))))))

; > (ogt 3 3)
; #f