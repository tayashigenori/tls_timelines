(load "./common/atom.scm")
(load "./a-pair.scm")
(load "./build.scm")
(load "./first.scm")
(load "./second.scm")
(load "./revpair.scm")

(define shuffle
  (lambda (pora)
    (cond
      ((atom? pora) pora)
      ((a-pair? (first pora))
       (shuffle (revpair pora)))
      (else (build (first pora)
                   (shuffle (second pora)))))))


; > (shuffle `(a (b c)))
; (a (b c))
; > (shuffle `(a b))
; (a b)
; > (shuffle `((a b) (c d)))
; never ends
