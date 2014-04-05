(load "./rember-f.scm")

(define rember-eq? (rember-f eq?))


; > (rember-eq? `tuna `(tuna salad is good))
; (salad is good)
