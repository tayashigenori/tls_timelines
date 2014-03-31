(load "./oequal.scm")

(define rember
  (lambda (s l)
    (cond
      ((null? l) (quote ()))
      ((atom? (car l))
       (cond
         ((equal? (car l) s) (cdr l))
         (else (cons (car l)
                     (rember s (cdr l))))))
      (else (cond
              ((oequal? (car l) s) (cdr l))
              (else (cons (car l)
                          (rember s
                                  (cdr l)))))))))

(rember `sauce `(soy sauce and tomato sauce))