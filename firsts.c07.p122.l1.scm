(define firsts
  (lambda (l)
    (cond
      ((null? l) (quote ()))
      (else (cons (car (car l))
                  (firsts (cdr l)))))))


; > (firsts `((a b) (c d) (e f)))
; (a c e)
