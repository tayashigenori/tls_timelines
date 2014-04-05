(load "a-friend.scm")

(define multirember&co
  (lambda (a lat col)
    (cond
      ((null? lat)
       (col (quote ()) (quote ())))
      ((eq? (car lat) a)
       (multirember&co a
                       (cdr lat)
                       (lambda (newlat seen)
                         (col newlat
                              (cons (car lat) seen)))))
      (else
       (multirember&co a
                       (cdr lat)
                       (lambda (newlat seen)
                         (col (cons (car lat) newlat)
                              seen)))))))


; > (multirember&co `tuna `(strawberries tuna and swordfish) a-friend)
; #f
; > (multirember&co `tuna `() a-friend)
; #t
; > (multirember&co `tuna `(tuna) a-friend)
; #f ; see new-friend
; > (multirember&co 'tuna `(and tuna) a-friend)
; #f ; see latest-friend

