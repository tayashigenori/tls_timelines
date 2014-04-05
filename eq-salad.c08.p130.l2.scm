(load "./eq-c.scm")

(define eq?-salad (eq?-c `salad))


; > (eq?-salad `salad)
; #t
; > (eq?-salad `tuna)
; #f
