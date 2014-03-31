(load "./common/atom.scm")

(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      ((eq? (car (cdr aexp)) (quote o+))
       ... )
      ((eq? (car (cdr aexp)) (quote omultiply))
       ... )
      ((eq? (car (cdr aexp)) (quote oexpt))
       ... ))))


; stub

; > (numbered? 1)
; #t
; > (numbered? `(3 o+ (4 oexpt 5)))
; #t
; > (numbered? `(2 omultiply sausage))
; #f
