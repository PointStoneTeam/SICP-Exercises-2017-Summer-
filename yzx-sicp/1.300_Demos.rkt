#lang scheme
;Demo_code1
(define (sum-integer a b)
  (if (> a b)
      0
      (+ a (sum-integer (+ a 1) b))))
(sum-integer 1 100)
;Demo_code2
(define (cube n)
  (* n n n))
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ 1 a) b))))
(sum-cubes 1 2)
;Demo_code3 converge to pi/8
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))
(pi-sum 1 51)
