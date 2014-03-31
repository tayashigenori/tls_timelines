(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((number? (car lat))
          (cons (car lat)
                (all-nums (cdr lat))))
         (else (all-nums (cdr lat))))))))

; > (all-nums `(5 pears 6 prunes 9 dates))
; (5 6 9)