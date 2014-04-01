(load "./member.scm")

(define set?
  (lambda (lat)
    (cond
      ((null? lat) #t)
      (else
       (cond
         ((member? (car lat) (cdr lat))
          #f)
         (else (set? (cdr lat))))))))

; > (set? `(apple peaches apple plum))
; #f
; > (set? `(apples peaches pears plums))
; #t
; > (set? `())
; #t
