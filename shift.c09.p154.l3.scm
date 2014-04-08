(load "./build.scm")
(load "./first.scm")
(load "./second.scm")

(define shift
  (lambda (pair)
    (build (first (first pair))
           (build (second (first pair))
                  (second pair)))))


; > (shift `((a b) c))
; (a (b c))
; > (shift `((a b) (c d)))
; (a (b (c d)))
