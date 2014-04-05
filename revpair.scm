(load "./build.scm")
(load "./first.scm")
(load "./second.scm")

(define revpair
  (lambda (pair)
    (build (second pair) (first pair))))
