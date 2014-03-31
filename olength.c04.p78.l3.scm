(load "./common/add1.scm")

(define olength
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else (add1 (olength (cdr lat)))))))


; > (olength `(hotdogs with mustard sauerkraut and pickles))
; 6
