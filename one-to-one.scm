(load "./fun.scm")
(load "./revrel.scm")

(define one-to-one?
  (lambda (fun)
    (fun? (revrel fun))))


; fullfun? = one-to-one?

; > (one-to-one? `((8 3) (4 2) (7 6) (6 2) (3 4)))
; #f
; > (one-to-one? `((8 3) (4 8) (7 6) (6 2) (3 4)))
; #t
; > (one-to-one? `((grape raisin)
;                  (plum prune)
;                  (stewed prune)))
; #f
; > (one-to-one? `((grape raisin)
;                  (plum prune)
;                  (stewed grape)))
; #t
; (one-to-one? `((chocolate chip) (doughy cookie)))
; #t
