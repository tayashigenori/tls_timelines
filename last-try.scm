(load "./will-stop.scm")

(define last-try
  (lambda (x)
    (and (will-stop? last-try)
         (eternity x))))

; will-stop? is yet to be implemented

; regardless of how will-stop? will be implemented
; computing
; > (last-try (quote ()))
; will result in contradictions

; (1) if you assume (will-stop? last-try) is #f
;     (last-try (quote ())) returns #f and stops,
;     which contradicts with the assumption that (will-stop? last-try) is #f
; (2) if you assume (will-stop? last-try) is #t
;     the value of (last-try (quote ())) equals to (eternity (quote ()) that will never stops
;     which contradicts with the assumption that (will-stop? last-try) is #t
