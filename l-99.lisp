;; Find the last box of a list

(defun my-last (lst)
    (if (cdr lst)
	(my-last (cdr lst))
	(car lst)))


 ;; Find the last but one box of a list


; this solultion appears to work, until you try it with a list of just
; one item

(defun my-second-last-broken (lst)
  (if (null (cddr lst))
      (car lst)
      (my-second-last (cdr lst))))

(defun my-second-last (lst)
  (if (cddr lst)
      (my-second-last (cdr lst))
      (and (cdr lst) (car lst))))

;; Problem 3 
;; Find the K'th element of a list
;; The first position is 1

(defun nth-element (lst K)
  (if (> K 1)
      (nth-element (cdr lst) (+ K -1))
      (car lst)))
      

;; Problem 4
; count items in list

(defun my-length (lst)
  (if lst
      (+ 1 
	 (my-length (cdr lst)))
      0))

;; Problem 5
; reverse a list


(defun my-reverse1 (lst)
  (if lst
      (append 
       (my-reverse (cdr lst)) 
       (list (car lst)))))

;; with an accumulator
(defun my-reverse2 (lst &optional (acc '()))
  (if lst
      (my-reverse2 (cdr lst) 
		   (cons (car lst) acc))
      acc))

; a third way involving keeping a refernce to the last cons
; of the reversed list as well as the first?
; perhaps with multiple value bind
; and/or reversing direction of cons association on the return pass


(setf my-reverse #'my-reverse2)

;; Problem 6
;       discover palindrome
(defun is-palindrome (lst)
  (equal lst (my-reverse lst)))


;; Problem 7
; Flatten a nested list structure
(defun my-flatten (X)
  (if X
      (if (listp X)
	  (if (listp (car X))
	     (append (my-flatten (car X)) (my-flatten (cdr X)))
	     (cons (car X) (my-flatten (cdr X))))
	  X)))
	    
;; Problem 8 
; Eliminate consecutive duplicates of list elements.
(defun compress (X) 
  (if X 
      (if (equal (car X) (cadr X))
	  (compress (cdr X))
	  (cons (car X) (compress (cdr X))))))

;; Problem 9
; Pack consecutive duplicates of list elements into sublists
(defun pack (X)
  (if X 
      (let ((f (car X)))
	(if (listp f)
	    (if (equal (car f) (cadr X))
		(let ((p (cons (cadr X) f)))
		  (pack (cons p (cddr X))))
		(cons f (pack (cdr X))))
	    (pack (cons (cons f '()) (cdr X)))))))
	    
; (there has to be a cleaner way)

;; Problem 10 
; Run-length encoding of a list

; cheap way
(defun RLE-1 (X)
    (mapcar (lambda (lst)
	      `(,(my-length lst) ,(car lst)))
	    (pack X)))
 