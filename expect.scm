(load-option 'format)

(define (!= a b)
    (not (= a b)))

(define (expect expected val)
    (if (!= expected val)
        (format #t "###### error: ~A != ~A ~%" expected val)))

(define (expect-true val)
    (if (not val)
        (format #t "###### error: #t != ~A ~%" val)))

(define (expect-false val)
    (if val
        (format #t "###### error: #f != ~A ~%" val)))

(define (list-eq lhs rhs)
    (cond ((and (null? lhs) (null? rhs)) #t)
          ((or (null? lhs) (null? rhs)) #f)
          (else (and (= (car lhs) (car rhs)) (list-eq (cdr lhs) (cdr rhs))))))

(define (expect-list expected val)
    (if (not (list-eq expected val))
        (format #t "###### error: ~A != ~A ~%" expected val)))
