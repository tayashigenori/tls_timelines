(load "./oequal.scm")

(define eqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((or (null? l1) (null? l2)) #f)
      (else
       (and (oequal? (car l1) (car l2))
            (eqlist? (cdr l1) (cdr l2)))))))


; > (eqlist? `(strawberry ice cream) `(strawberry ice cream))
; #t
; > (eqlist? `(strawberry ice cream) `(strawberry cream ice))
; #f
; > (eqlist? `(banana ((split))) `((banana) (split)))
; #f
; > (eqlist? `(beef ((sausage)) (and (soda))) `(beef ((sausage)) (and (soda))))
; #t
