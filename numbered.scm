(load "./common/atom.scm")

(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      (else
       (and (numbered? (car aexp))
            (numbered?
             (car (cdr (cdr aexp)))))))))


; > (numbered? 1)
; #t
; > (numbered? `(3 o+ (4 oexpt 5)))
; #t
; > (numbered? `(2 omultiply sausage))
; #f
