(load "./subset.scm")

(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2)
         (subset? set2 set1))))


; > (eqset? `(6 large chickens with wings) `(6 chickens with large wings))
; #t
