#lang scheme

 ;; a) 
 (define (get-record division employee-name) 
   ((get division 'record) employee-name)) 
  
 ;; b) 
 (define (get-salary division record) 
   ((get division 'salary) record)) 
  
 ;; c) 
 (define (find-employee-record employee-name division-list) 
   (if (null? division-list) 
       #f 
       (or (get-record (car division-list) employee-name) 
           (find-employee-record employee-name (cdr division-list)))))
 ;; d)
 ;the new company needs to install its 'record and 'salary generic procedures into the lookup table using its name as the first key.

