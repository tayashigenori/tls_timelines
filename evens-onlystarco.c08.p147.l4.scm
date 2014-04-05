(load "./common/atom.scm")
(load "./oeven.scm")
(load "./o+.scm")
(load "./omultiply.scm")

(define evens-only*&co
  (lambda (l col)
    (cond
      ((null? l)
       (col (quote ()) 1 0))
      ((atom? (car l))
       (cond
         ((oeven? (car l)) ;;; if (car l) is even
          (evens-only*&co (cdr l)
                          (lambda (newl p s)
                            (col (cons (car l) newl)   ; newl: unchanged
                                 (omultiply (car l) p) ; product: multiplied
                                 s))))                 ; sum: unchanged
         (else (evens-only*&co (cdr l) ;;; if (car l) is odd
                               (lambda (newl p s)
                                 (col newl                 ; newl: cdr-ed
                                      p                    ; product: unchanged
                                      (o+ (car l) s))))))) ; sum: added
      (else (evens-only*&co (car l)
                            ...)))))


; stub
