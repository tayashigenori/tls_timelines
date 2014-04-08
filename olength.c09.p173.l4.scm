(load "./common/add1.scm")

(define olength
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     (lambda (l)
       (cond
         ((null? l) 0)
         (else
          (add1
           ((lambda (x)
              ((mk-length mk-length) x))
            (cdr l))))))))
  )

; > (olength `(hotdogs with mustard sauerkraut and pickles))
; 6
