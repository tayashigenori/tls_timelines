(load "./seconds.scm")
(load "./set.scm")

(define fullfun?
  (lambda (fun)
    (set? (seconds fun))))


; > (fullfun? `((8 3) (4 2) (7 6) (6 2) (3 4)))
; #f
; > (fullfun? `((8 3) (4 8) (7 6) (6 2) (3 4)))
; #t
; > (fullfun? `((grape raisin)
;               (plum prune)
;               (stewed prune)))
; #f
; > (fullfun? `((grape raisin)
;               (plum prune)
;               (stewed grape)))
; #t
