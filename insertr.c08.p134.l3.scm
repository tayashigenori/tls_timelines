(load "./insert-g.scm")
(load "./seqr.scm")

(define insertR (insert-g seqR))


; > (insertR `topping `fudge `(ice cream with fudge for dessert))
; (ice cream with fudge topping for dessert)
