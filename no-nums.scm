(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((number? (car lat))
               (no-nums (cdr lat)))
              (else (cons (car lat)
                          (no-nums
                           (cdr lat)))))))))

; > (no-nums `(5 pear 6 prunes 9 dates))
; (pear prunes dates)