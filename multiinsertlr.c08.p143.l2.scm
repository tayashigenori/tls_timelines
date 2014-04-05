(define multiinsertLR
  (lambda (new oldL oldR lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) oldL)
       (cons new
             (cons oldL
                   (multiinsertLR new oldL oldR
                                  (cdr lat)))))
      ((eq? (car lat) oldR)
       (cons oldR
             (cons new
                   (multiinsertLR new oldL oldR
                                  (cdr lat)))))
      (else (cons (car lat)
                  (multiinsertLR new oldL oldR
                                 (cdr lat)))))))


; > (multiinsertLR `fried `fish `chips `(chips and fish or fish and fried))
; (chips fried and fried fish or fried fish and fried)
