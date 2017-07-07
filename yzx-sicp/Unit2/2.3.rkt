;3-perimeter
#lang scheme
(define (perimeter-rectangle r)
  (let ((length (length-of-rectangle r))
        (width (width-of-rectangle r)))
    (* 2 (+ length width))))
;square
(define (area-rectangle r)
  (* (length-of-rectangle r)
     (width-of-rectangle r)))
;使用两对线段表示矩形
;constructor
(define (make-rectangle length-1 length-2 width-1 width-2)
  (cons (cons length-1 length-2)
        (cons width-1 width-2)))
;selector
(define (length-1-rectangle r)
  (car (car r)))
(define (length-2-rectangle r)
  (cdr (car r)))
(define (width-1-rectangle r)
  (car (cdr r)))
(define (width-2-rectangle r)
  (cdr (cdr r)))
;point constructor
(define (make-point x y)
  (cons x y))
;segment-constructor
(define (make-segment start-point end-point)
  (cons start-point end-point))
;segment-selector
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

;test data
(define length-1 (make-segment (make-point 1 4)
                               (make-point 4 4)))
(define length-2 (make-segment (make-point 1 2)
                               (make-point 4 2)))
(define width-1 (make-segment (make-point 1 2)
                              (make-point 4 2)))
(define width-2 (make-segment (make-point 4 2)
                              (make-point 4 4)))
(define rectangle (make-point length-1 length-2 width-1 width-2))
  
