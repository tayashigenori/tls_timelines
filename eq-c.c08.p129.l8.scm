(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a))))


; > (eq?-c `salad)
; #<procedure:....