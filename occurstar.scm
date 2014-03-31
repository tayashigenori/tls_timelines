(load "./common/atom.scm")
(load "./common/add1.scm")
(load "./o+.scm")

(define occur*
  (lambda (a l)
    (cond
      ((null? l) 0)
      ((atom? (car l))
       (cond
         ((eq? (car l) a)
          (add1 (occur* a (cdr l))))
         (else (occur* a (cdr l)))))
      (else (o+ (occur* a (car l))
                (occur* a (cdr l)))))))


; > (occur* `banana `((banana)
;                     (split ((((banana ice)))
;                             (cream (banana))
;                             sherbet))
;                     (banana)
;                     (bread)
;                     (banana brandy)))
; 5
