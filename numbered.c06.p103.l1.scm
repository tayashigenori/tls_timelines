(load "./common/atom.scm")

(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      ((eq? (car (cdr aexp)) (quote o+))
       (and (numbered? (car aexp))
            (numbered? (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) (quote omultiply))
       (and (numbered? (car aexp))
            (numbered?
             (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) (quote oexpt))
       (and (numbered? (car aexp))
            (numbered?
             (car (cdr (cdr aexp)))))))))


; > (numbered? 1)
; #t
; > (numbered? `(3 o+ (4 oexpt 5)))
; #t
; > (numbered? `(2 omultiply sausage))
; #f
