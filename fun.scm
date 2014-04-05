(load "./firsts.scm")
(load "./set.scm")

(define fun?
  (lambda (rel)
    (set? (firsts rel))))


; "rel" stands for relation and is a set of pairs
; "fun" stands for function and (firsts rel) is a set

; > (fun? `((4 3) (4 2) (7 6) (6 2) (3 4)))
; #f
; > (fun? `((8 3) (4 2) (7 6) (6 2) (3 4)))
; #t
; > (fun? `((b 4) (b 0) (b 9) (e 5) (g 4)))
; #f
