(load "./common/atom.scm")

(define rember*
  (lambda (a l)
    (cond
      ((null? l) (quote ()))
      ((atom? (car l))
       (cond
         ((eq? (car l) a)
          (rember* a (cdr l)))
         (else (cons (car l)
                     (rember* a (cdr l))))))
      (else (cons (rember* a (car l))
                  (rember* a (cdr l)))))))


; > (rember* `cup `((coffee) cup ((tea) cup)
;                            (and (hick)) cup))
; ((coffee) ((tea)) (and (hick)))
; > (rember* `sauce `(((tomato sauce))
;                     ((bean) sauce)
;                     (and ((flying)) sauce)))
; (((tomato)) ((bean)) (and ((flying))))