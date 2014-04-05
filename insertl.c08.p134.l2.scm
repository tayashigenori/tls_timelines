(load "./insert-g.scm")
(load "./seqL.scm")

(define insertL (insert-g seqL))

; > (insertL `topping `fudge `(ice cream with fudge for dessert))
; (ice cream with topping fudge for dessert)
