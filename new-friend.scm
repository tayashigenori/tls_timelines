(load "./a-friend.scm")

(define new-friend
  (lambda (newlat seen)
    (a-friend newlat
         (cons (quote tuna) seen))))


; > (new-friend `() `())
; #f
