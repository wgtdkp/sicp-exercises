(load "expect.scm")

(define (cc amount coin-values)
    (define (no-more? li)
        (null? li))
    (define (except-first-denomination li)
        (cdr li))
    (define (first-denomination li)
        (car li))
    (cond ((= amount 0) 1)
          ((or (< amount 0) (no-more? coin-values)) 0)
          (else
           (+ (cc amount (except-first-denomination coin-values))
              (cc (- amount (first-denomination coin-values))
                  coin-values)))))

; test
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(expect 292 (cc 100 us-coins))
(expect 104561 (cc 100 uk-coins))
