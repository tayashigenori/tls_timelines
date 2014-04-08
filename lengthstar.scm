(load "./common/atom.scm")
(load "./first.scm")
(load "./second.scm")
(load "./o+.scm")

(define length*
  (lambda (para)
    (cond
      ((atom? para) 1)
      (else
       (o+ (length* (first para))
           (length* (second para)))))))
