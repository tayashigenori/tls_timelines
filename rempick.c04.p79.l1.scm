(load "./common/sub1.scm")

(define rempick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (cdr lat))
      (else (cons (car lat)
                  (rempick (sub1 n)
                           (cdr lat)))))))

; > (rempick 3 `(hotdogs with hot mustard))
; (hotdogs with mustard)
