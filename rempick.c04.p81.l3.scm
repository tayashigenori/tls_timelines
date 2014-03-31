(load "./common/sub1.scm")
(load "./one.scm")

(define rempick
  (lambda (n lat)
    (cond
      ((one? n) (cdr lat))
      (else (cons (car lat)
                  (rempick (sub1 n)
                           (cdr lat)))))))

; > (rempick 3 `(lemon meringue salty pie))
; (lemon meringue pie)
