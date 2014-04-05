(load "./oequal.scm")

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) (quote ()))
        ((test? (car l) a) (cdr l))
        (else (cons (car l)
                    ((rember-f test?) a
                                      (cdr l))))))))


; > ((rember-f eq?) `tuna `(tuna salad is good))
; (salad is good)
; > ((rember-f eq?) `tuna `(shrimp salad and tuna salad))
; (shrimp salad and salad)
; > ((rember-f eq?) `eq? `(oequal? eq? eqan? eqlist? eqpair?))
; (oequal? eqan? eqlist? eqpair?)
