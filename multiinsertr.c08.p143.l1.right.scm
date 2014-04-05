(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old)
       (cons old
             (cons new
                   (multiinsertR new old
                                 (cdr lat)))))
      (else (cons (car lat)
                  (multiinsertR new old
                                (cdr lat)))))))


; > (multiinsertR `fried `fish `(chips and fish or fish and fried))
; (chips and fish fried or fish fried and fried)
