(load "./common/atom.scm")
(load "./eqan.scm")
(load "./eqlist.scm")

(define oequal?
  (lambda (s1 s2)
    (cond
      ((and (atom? s1) (atom? s2))
       (eqan? s1 s2))
      ((or (atom? s1) (atom? s2))
       #f)
      (else (eqlist? s1 s2)))))


; > (oequal? `(() 1) `(() 1))
; #t
