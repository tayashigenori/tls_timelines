(load "./common/atom.scm")

(define insertR*
  (lambda (new old l)
    (cond
      ((null? l) (quote ()))
      ((atom? (car l))
       (cond
         ((eq? (car l) old)
          (cons old
                (cons new
                      (insertR* new old
                                (cdr l)))))
         (else (cons (car l)
                     (insertR* new old
                               (cdr l))))))
      (else (cons (insertR* new old
                            (car l))
                  (insertR* new old
                            (cdr l)))))))


; > (insertR* `roast `chuck `((how much (wood))
;                             could
;                             ((a (wood) chuck))
;                             (((chuck)))
;                             (if (a) ((wood chuck)))
;                             could chuck wood))
; ((how much (wood)) could ((a (wood) chuck roast)) (((chuck roast))) (if (a) ((wood chuck roast))) could chuck roast wood)