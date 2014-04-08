(load "./common/add1.scm")

; see 2f41c0f08504600546b7a7279b9c8916d9d21df5
(define olength
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     (lambda (l)
       (cond
         ((null? l) 0)
         (else (add1
                ((mk-length mk-length)
                 (cdr l))))))))
  )

; > (olength `(hotdogs with mustard sauerkraut and pickles))
; 6
