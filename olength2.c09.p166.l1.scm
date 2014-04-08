(load "./common/add1.scm")
(load "./eternity.scm")

(define olength<=2 ; here define is not used in the Little Schemer
  ((lambda (length)
     (lambda (l)
       (cond
         ((null? l) 0)
         (else (add1 (length (cdr l)))))))
   ((lambda (length)
      (lambda (l)
        (cond
          ((null? l) 0)
          (else (add1 (length (cdr l)))))))
    ((lambda (length)
       (lambda (l)
         (cond
           ((null? l) 0)
           (else (add1 (length (cdr l)))))))
     eternity)))
  )

; > (olength<=2 `())
; 0
; > (olength<=2 `(hotdogs))
; 1
; > (olength<=2 `(hotdogs with))
; 2
; > (olength<=2 `(hotdogs with mustard))
; never stops
