(load "./common/atom.scm")
(load "./a-pair.scm")
(load "./build.scm")
(load "./first.scm")
(load "./second.scm")
(load "./shift.scm")

(define align
  (lambda (para)
    (cond
      ((atom? para) para)
      ((a-pair? (first para))
       (align (shift para)))
      (else (build (first para)
                   (align (second para)))))))


; > (align `((a b) c))
; (a (b c))
; > (align `((a b) (c d)))
; (a (b (c d)))
