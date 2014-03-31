(load "./common/sub1.scm")
(load "./o+.scm")

(define omultiply
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (o+ n (omultiply n (sub1 m)))))))

; > (omultiply 12 3)
; 36
