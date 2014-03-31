(load "./common/sub1.scm")
(load "./omultiply.scm")

(define oexpt
  (lambda (n m)
    (cond
      ((zero? m) 1)
      (else (omultiply n (oexpt n (sub1 m)))))))

; > (oexpt 2 3)
; 8
; > (oexpt 5 3)
; 125