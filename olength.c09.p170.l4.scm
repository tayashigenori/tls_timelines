(load "./common/add1.scm")

(define olength
  ((lambda (mk-length)
     (mk-length mk-length))
   (lambda (mk-length)
     ((lambda (length)
        (lambda (l)
          (cond
            ((null? l) 0)
            (else (add1 (length (cdr l)))))))
      (mk-length mk-length))))
  )

; doesn't work!!

; to evaluate the following expression:
;   ((lambda (mk-length)
;      (mk-length mk-length))
;    (lambda (mk-length)
;      ((lambda (length)
;         (lambda (l)
;           (cond
;             ((null? l) 0)
;             (else (add1 (length (cdr l)))))))
;       (mk-length mk-length))))

; we need to evaluate the following expression:
;   ((lambda (mk-length)
;      ((lambda (length)
;         (lambda (l)
;           (cond
;             ((null? l) 0)
;             (else (add1 (length (cdr l)))))))
;       (mk-length mk-length)))
;    (lambda (mk-length)
;      ((lambda (length)
;         (lambda (l)
;           (cond
;             ((null? l) 0)
;             (else (add1 (length (cdr l)))))))
;       (mk-length mk-length))))

; which requires us to evaluate the following expression:
;   ((lambda (length)
;      (lambda (l)
;        (cond
;          ((null? l) 0)
;          (else (add1 (length (cdr l)))))))
;   ((lambda (mk-length)
;      ((lambda (length)
;         (lambda (l)
;           (cond
;             ((null? l) 0)
;             (else (add1 (length (cdr l)))))))
;       (mk-length mk-length)))
;    (lambda (mk-length)
;      ((lambda (length)
;         (lambda (l)
;           (cond
;             ((null? l) 0)
;             (else (add1 (length (cdr l)))))))
;       (mk-length mk-length))))

; which requires us to evaluate the following expression:
;   ((lambda (length)
;      (lambda (l)
;        (cond
;          ((null? l) 0)
;          (else (add1 (length (cdr l)))))))
;   ((lambda (length)
;      (lambda (l)
;        (cond
;          ((null? l) 0)
;          (else (add1 (length (cdr l)))))))
;   ((lambda (mk-length)
;      ((lambda (length)
;         (lambda (l)
;           (cond
;             ((null? l) 0)
;             (else (add1 (length (cdr l)))))))
;       (mk-length mk-length)))
;    (lambda (mk-length)
;      ((lambda (length)
;         (lambda (l)
;           (cond
;             ((null? l) 0)
;             (else (add1 (length (cdr l)))))))
;       (mk-length mk-length))))
