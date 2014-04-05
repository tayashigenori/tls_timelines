(load "./member.scm")

(define diff
  (lambda (set1 set2)
    (cond
      ((null? set1) (quote ()))
      ((member? (car set1) set2)
       (diff (cdr set1) set2))
      (else (cons (car set1)
                  (diff (cdr set1) set2))))))


; > (diff `(stewed tomatoes and
;                  macaroni casserole)
;         `(macaroni and cheese))
; (stewed tomatoes casserole)
