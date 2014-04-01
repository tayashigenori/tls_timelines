(load "./member.scm")

(define subset?
  (lambda (set1 set2)
    (cond
      ((null? set1) #t)
      (else
       (and (member? (car set1) set2)
       (subset? (cdr set1) set2))))))


; > (subset? `(5 chicken wings) `(5 hamburgers 2 pieces fried chicken and light duckling wings))
; #t
; > (subset? `(4 pounds of horseradish) `(four pounds chicken and 5 ounces horseradish))
; #f
