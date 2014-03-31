(load "./o+.scm")

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((and (null? tup1) (null? tup2))
       (quote ()))
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else
       (cons (o+ (car tup1) (car tup2))
             (tup+
              (cdr tup1) (cdr tup2)))))))

; > (tup+ `(3 7) `(4 6 8 1))
; (7 13 8 1)