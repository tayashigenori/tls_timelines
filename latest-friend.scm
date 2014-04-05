(load "./a-friend.scm")

(define latest-friend
  (lambda (newlat seen)
    (a-friend (cons (quote and) newlat)
              seen)))


; > (latest-friend `()
;                  `(cons (tuna) ()))
; #f
