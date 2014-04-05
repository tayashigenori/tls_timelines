(define subst
  (lambda (new old l)
    (cond
      ((null? l) (quote ()))
      ((eq? (car l) old)
       (cons new (cdr l)))
      (else (cons (car l)
                  (subst new old (cdr l)))))))


; > (subst `topping `fudge `(ice cream with fudge for dessert))
; (ice cream with topping for dessert)
