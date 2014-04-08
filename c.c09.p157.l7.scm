(load "./common/add1.scm")
(load "./one.scm")
(load "./oeven.scm")
(load "./omultiply.scm")
(load "./oquotient.scm")

(define C
  (lambda (n)
    (cond
      ((one? n) 1)
      (else
       (cond
         ((even? n) (C (oquotient n 2)))
         (else (C (add1 (omultiply 3 n)))))))))


; > (C 0)
; never ends
; > (C 1)
; 1
; > (C 2)
; 1
; > (C 3)
; 1
; > (C 4)
; 1
; > (C 5)
; 1
