(load "./common/add1.scm")
(load "./o-.scm")
(load "./olt.scm")

(define oquotient
  (lambda (n m)
    (cond
      ((olt n m) 0)
      (else (add1 (oquotient (o- n m) m))))))

; > (oquotient 15 4)
; 3