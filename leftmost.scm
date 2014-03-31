(load "./common/atom.scm")

(define leftmost
  (lambda (l)
    (cond
      ((atom? (car l)) (car l))
      (else (leftmost (car l))))))


; > (leftmost `((potato) (chips ((with) fish) (chips))))
; potato
; > (leftmost `(((hot) (tuna (and))) cheese))
; hot
; > (leftmost `(((() four)) 17 (seventeen)))
; causes error "mcar: expects argument of type <mutable-pair>; given ()"
; > (leftmost (quote ()))
; causes error "mcar: expects argument of type <mutable-pair>; given ()"
