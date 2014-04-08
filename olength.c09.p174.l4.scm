(load "./common/add1.scm")

(define olength
  ((lambda (le)
     ((lambda (mk-length)
        (mk-length mk-length))
      (lambda (mk-length)
        (le (lambda (x)
              ((mk-length mk-length) x))))))
   (lambda (length)
     (lambda (l)
       (cond
         ((null? l) 0)
         (else (add1 (length (cdr l))))))))
  )

; > (olength `(hotdogs with mustard sauerkraut and pickles))
; 6
