(load "./member.scm")

(define makeset
  (lambda (lat)
    (cond
      ((null? lat) (quote ()))
      ((member? (car lat) (cdr lat))
       (makeset (cdr lat)))
      (else (cons (car lat)
                  (makeset (cdr lat)))))))


; > (makeset `(apple peach pear peach
;                    plum apple lemon peach))
; (pear plum apple lemon peach)
