(load "./intersect.scm")

(define intersectall
  (lambda (l-set)
    (cond
      ((null? (cdr l-set)) (car l-set))
      (else (intersect (car l-set)
                       (intersectall (cdr l-set)))))))


; > (intersectall `((a b c) (c a d e) (e f g h a b)))
; (a)
; > (intersectall `((6 pears and)
;                   (3 peaches and 6 peppers)
;                   (8 pears and 6 plums)
;                   (and 6 prunes with lots of apples)))
; (6 and)
