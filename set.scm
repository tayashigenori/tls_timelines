(load "./member.scm")

(define set?
  (lambda (lat)
    (cond
      ((null? lat) #t)
      ((member? (car lat) (cdr lat)) #f)
      (else (set? (cdr lat))))))

; > (set? `(apple peaches apple plum))
; #f
; > (set? `(apples peaches pears plums))
; #t
; > (set? `())
; #t
; > (set? `(apple 3 pear 4 9 apple 3 4))
; #f
