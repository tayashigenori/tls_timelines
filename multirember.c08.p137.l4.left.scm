(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) a)
       (multirember a (cdr lat)))
      (else (cons (car lat)
                  (multirember a
                               (cdr lat)))))))

; > (multirember `cup `(coffee cup tea cup and hick cup))
; (coffee tea and hick)
