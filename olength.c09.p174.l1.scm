(load "./common/add1.scm")

(define olength
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     ((lambda (length)
        (lambda (l)
          (cond
            ((null? l) 0)
            (else
             (add1 (length (cdr l)))))))
      (lambda (x)
        ((mk-length mk-length) x)))))
  )

; > (olength `(hotdogs with mustard sauerkraut and pickles))
; 6
