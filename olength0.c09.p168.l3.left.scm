(load "./common/add1.scm")

(define olength0 ; here define is not used in the Little Schemer
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (length)
     (lambda (l)
       (cond
         ((null? l) 0)
         (else (add1
                (length (cdr l))))))))
  )

; > (olength0 `())
; 0
; > (olength0 `(hotdogs with mustard sauerkraut and pickles))
; returns error "+: expects type <number> as 1st argument, given: #<procedure:....scm:7:5>; other arguments were: 1"
