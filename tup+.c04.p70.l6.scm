(load "./o+.scm")

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((and (null? tup1) (null? tup2))
       (quote ()))
      (else
       (cons (o+ (car tup1) (car tup2))
             (tup+
              (cdr tup1) (cdr tup2)))))))

; > (tup+ `(3 6 9 11 4) `(8 5 2 0 7))
; (11 11 11 11 11)