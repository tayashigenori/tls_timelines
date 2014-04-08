(load "./common/add1.scm")
(load "./eternity.scm")

(define olength0 ; here define is not used in the Little Schemer
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (add1 (olength0 (cdr l))))))
  )

; > (olength0 `())
; 0
; > (olength0 `(hotdogs with mustard sauerkraut and pickles))
; 6 ; this would not work without define
