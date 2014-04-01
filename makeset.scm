(load "./multirember.scm")

(define makeset
  (lambda (lat)
    (cond
      ((null? lat) (quote ()))
      (else (cons (car lat)
                  (makeset
                   (multirember (car lat)
                                (cdr lat))))))))


; > (makeset `(apple peach pear peach
;                    plum apple lemon peach))
; (apple peach pear plum lemon)
