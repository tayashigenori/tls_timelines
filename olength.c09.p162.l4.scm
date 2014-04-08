(load "./common/add1.scm")

(define olength
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (add1 (length (cdr l)))))))


; > (olength `(hotdogs with mustard sauerkraut and pickles))
; 6
