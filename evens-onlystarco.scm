(load "./common/atom.scm")
(load "./oeven.scm")
(load "./o+.scm")
(load "./omultiply.scm")
(load "./the-last-friend.scm")

(define evens-only*&co
  (lambda (l col)
    (cond
      ((null? l)
       (col (quote ()) 1 0))
      ((atom? (car l))
       (cond
         ((oeven? (car l)) ;;; if (car l) is even
          (evens-only*&co (cdr l)
                          (lambda (newl p s)
                            (col (cons (car l) newl)   ; newl: unchanged
                                 (omultiply (car l) p) ; product: multiplied
                                 s))))                 ; sum: unchanged
         (else (evens-only*&co (cdr l) ;;; if (car l) is odd
                               (lambda (newl p s)
                                 (col newl                 ; newl: cdr-ed
                                      p                    ; product: unchanged
                                      (o+ (car l) s))))))) ; sum: added
      (else (evens-only*&co (car l)
                            (lambda (al ap as) ; car_l car_product car_sum
                              (evens-only*&co (cdr l)
                                              (lambda (dl dp ds) ; cdr_l cdr_product cdr_sum
                                                (col (cons al dl)        ; cons car_l cdr_l
                                                     (omultiply ap dp)   ; * car_product cdr_product
                                                     (o+ as ds)))))))))) ; + car_sum cdr_sum


; > (evens-only*&co `((9 1 2 8) 3 10 ((9 9) 7 6) 2) the-last-friend)
; (38 1920 (2 8) 10 (() 6) 2)
