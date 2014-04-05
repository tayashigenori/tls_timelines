(load "./insert-g.scm")

(define insertL
  (insert-g
   (lambda (new old l)
     (cons new (cons old l)))))


; > (insertL `topping `fudge `(ice cream with fudge for dessert))
; (ice cream with topping fudge for dessert)
