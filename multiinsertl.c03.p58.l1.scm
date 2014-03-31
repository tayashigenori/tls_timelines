(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((eq? (car lat) old)
          (cons new
                (cons old
                      (multiinsertL new old
                                    lat))))
         (else (cons (car lat)
                     (multiinsertL new old
                                   (cdr lat)))))))))

(multiinsertL `fried `fish `(chips and fish or fish and fried))
; don't run this script, this never ends