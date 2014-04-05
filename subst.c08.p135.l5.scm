(load "./insert-g.scm")
(load "./seqs.scm")

(define subst (insert-g seqS))


; > (subst `topping `fudge `(ice cream with fudge for dessert))
; (ice cream with topping for dessert)
