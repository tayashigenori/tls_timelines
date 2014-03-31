(load "./common/atom.scm")

(define member*
  (lambda (a l)
    (cond
      ((null? l) #f) ; nil --> #f
      ((atom? (car l))
       (or (eq? (car l) a)
           (member* a (cdr l))))
      (else (or (member* a (car l))
                (member* a (cdr l)))))))


; > (member* `chips `((potato) (chips ((with) fish) (chips))))
; #t
