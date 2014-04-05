(load "./common/atom.scm")

(define a-pair?
  (lambda (x)
    (cond
      ((atom? x) #f)
      ((null? x) #f)
      ((null? (cdr x)) #f)
      ((null? (cdr (cdr x))) #t)
      (else #f))))


; > (a-pair? `(pear pear))
; #t
; > (a-pair? `(3 7))
; #t
; > (a-pair? `((2) (pair)))
; #t
; > (a-pair? `(full (house)))
; #t
