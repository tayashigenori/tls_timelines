(load "./o+.scm")

(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (o+ (car tup) (addtup (cdr tup)))))))

; > (addtup `(3 5 2 8))
; 18
; > (addtup `(15 6 7 12 3))
; 43