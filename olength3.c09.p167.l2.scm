(load "./common/add1.scm")
(load "./eternity.scm")

(define olength<=3 ; here define is not used in the Little Schemer
  ((lambda (mk-length)
     (mk-length
      (mk-length
       (mk-length
        (mk-length eternity)))))
   (lambda (length)
     (lambda (l)
       (cond
         ((null? l) 0)
         (else (add1 (length (cdr l))))))))
  )

; > (olength<=3 `())
; 0
; > (olength<=3 `(hotdogs))
; 1
; > (olength<=3 `(hotdogs with))
; 2
; > (olength<=3 `(hotdogs with mustard))
; 3
; > (olength<=3 `(hotdogs with mustard sauerkraut))
; never stops
