(load "./common/add1.scm")

(define multiinsertLR&co
  (lambda (new oldL oldR lat col)
    (cond
      ((null? lat)
       (col (quote ()) 0 0))
      ((eq? (car lat) oldL)
       (multiinsertLR&co new oldL oldR
                         (cdr lat)
                         (lambda (newlat L R)
                           (col (cons new
                                      (cons oldL newlat))
                                (add1 L) R))))
      ((eq? (car lat) oldR)
       (multiinsertLR&co new oldL oldR
                         (cdr lat)
                         (lambda (newlat L R)
                           (col (cons oldR (cons new newlat))
                                L (add1 R)))))
      (else
       (multiinsertLR&co new oldL oldR
                         (cdr lat)
                         (lambda (newlat L R)
                           (col (cons (car lat) newlat)
                                L R)))))))
; helper function
(define dummy-col
  (lambda (lat l r)
    (cons lat
          (cons l r))))

; > (multiinsertLR&co `salty `fish `chips `(chips and fish or fish and chips))
; returns error "procedure multiinsertlr&co: expects 5 arguments, given 4: salty fish chips (chips and fish or fish and chips)"

; > (multiinsertLR&co `salty `fish `chips `(chips and fish or fish and chips) dummy-col)
; ((chips salty and salty fish or salty fish and chips salty) 2 . 2)
