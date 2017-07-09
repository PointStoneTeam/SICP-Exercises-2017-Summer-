(define (new-if bool then-case else-case)
 (cond (bool then-case)
	   (else else-case)))
(define (gcd a b)
  (new-if (= b 0) 
   a 
   (gcd b (remainder a b))))

