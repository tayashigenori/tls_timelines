(load "./subset.scm")

(define eqset?
  (lambda (set1 set2)
    (cond
      ((subset? set1 set2)
       (subset? set2 set1))
      (else #f))))


; > (eqset? `(6 large chickens with wings) `(6 chickens with large wings))
; #t
