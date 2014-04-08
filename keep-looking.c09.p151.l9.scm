(load "./pick.scm")

(define keep-looking
  (lambda (a sorn lat) ; sorn stands for "Symbol Or Number"
    (cond
      ((number? sorn)
       (keep-looking a (pick sorn lat) lat))
      (else (eq? sorn a)))))


; > (keep-looking `caviar (pick 1 `(6 2 4 caviar 5 7 3)) `(6 2 4 caviar 5 7 3))
; #t
; > (keep-looking `caviar 6 `(6 2 4 caviar 5 7 3))
; #t
; > (keep-looking `caviar 7 `(6 2 4 caviar 5 7 3))
; #t
; > (keep-looking `caviar 3 `(6 2 4 caviar 5 7 3))
; #t
; > (keep-looking `caviar 4 `(6 2 4 caviar 5 7 3))
; #t
