(load "./oequal.scm")

(define rember
  (lambda (s l)
    (cond
      ((null? l) (quote ()))
      ((oequal? (car l) s) (cdr l))
      (else (cons (car l)
                  (rember s (cdr l)))))))

(rember `sauce `(soy sauce and tomato sauce))