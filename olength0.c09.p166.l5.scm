(load "./common/add1.scm")
(load "./eternity.scm")

(define olength0 ; here define is not used in the Little Schemer
  ((lambda (mk-length)
     (mk-length eternity))
   (lambda (length)
     (lambda (l)
       (cond
         ((null? l) 0)
         (else (add1 (length (cdr l))))))))
  )

; > (olength0 `())
; 0
; > (olength0 `(hotdogs with mustard sauerkraut and pickles))
; never stops
