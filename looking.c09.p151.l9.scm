(load "./keep-looking.scm")
(load "./pick.scm")

(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)))


; > (looking `caviar `(6 2 4 caviar 5 7 3))
; #t
; > (looking `caviar `(6 2 grits caviar 5 7 3))
; #f
; > (looking `caviar `(7 1 2 caviar 5 6 3))
; never ends
