(load "./common/add1.scm")
(load "./eternity.scm")

(define olength<=1 ; here define is not used in the Little Schemer
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     (lambda (l)
       (cond
         ((null? l) 0)
         (else (add1
                ((mk-length eternity)
                 (cdr l))))))))
  )

; > (olength<=1 `())
; 0
; > (olength<=1 `(hotdogs))
; 1
; > (olength<=1 `(hotdogs with))
; never stops
