(define rember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((eq? (car lat) a) (cdr lat))
              (else (rember a (cdr lat))))))))

(rember `bacon `(bacon lettuce and tomato))