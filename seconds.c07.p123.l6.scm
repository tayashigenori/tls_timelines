(load "./second.scm")

(define seconds
  (lambda (l)
    (cond
      ((null? l) (quote ()))
      (else (cons (second (car l))
                  (seconds (cdr l)))))))


; > (seconds `((a b) (c d) (e f)))
; (b d f)
