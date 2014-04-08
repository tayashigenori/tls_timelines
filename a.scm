(load "./common/add1.scm")
(load "./common/sub1.scm")

(define A
  (lambda (n m)
    (cond
      ((zero? n) (add1 m))
      ((zero? m) (A (sub1 n) 1))
      (else (A (sub1 n)
               (A n (sub1 m)))))))


; > (A 1 0)
; 2
; > (A 1 1)
; 3
; > (A 2 2)
; 7
; > (A 1 2)
; 4
; > (A 4 3)
; takes very long
