(load "./common/sub1.scm")

(define ogt
  (lambda (n m)
    (cond
      ((zero? m) #t)
      ((zero? n) #f)
      (else (ogt (sub1 n) (sub1 m))))))

; > (ogt 12 133)
; #f
; > (ogt 120 11)
; #t
; > (ogt 3 3)
; #t ;; wrong!!
