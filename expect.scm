(load-option 'format)

(define (expect expected val)
    (if (or (and (pair? expected) (not (pair? val))) (and (pair? val) (not (pair? expected))))
        (format #t "###### type error: type(~A) != type(~A) ~%" expected val)
        (if (not (eq expected val))
            (format #t "###### error: ~A != ~A ~%" expected val))))

(define (eq a b)
    (cond ((and (null? a) (null? b)) #t)
          ((or  (null? a) (null? b)) #f)
          ((and (pair? a) (pair? b)) 
            (and (eq (car a) (car b)) (eq (cdr a) (cdr b))))
          ((or  (pair? a) (pair? b)) #f)
          (else (= a b))))

