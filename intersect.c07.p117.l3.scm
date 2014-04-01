(load "./member.scm")

(define intersect?
  (lambda (set1 set2)
    (cond
      ((null? set1) #f)
      (else (or (member? (car set1) set2)
                (intersect?
                 (cdr set1) set2))))))


; > (intersect? `(stewed tomatoes and macaroni) `(macaroni and cheese))
; #t
