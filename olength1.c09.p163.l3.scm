(load "./common/add1.scm")
(load "./eternity.scm")

(define olength<=1 ; here define is not used in the Little Schemer
  (lambda (l)
    (cond
      ((null? l) 0)
      (else
       (add1
        ((lambda (l)
           (cond
             ((null? l) 0)
             (else (add1
                    (eternity (cdr l))))))
         (cdr l))))))
  )

; > (olength<=1 `())
; 0
; > (olength<=1 `(hotdogs))
; 1
; > (olength<=1 `(hotdogs with))
; never stops
