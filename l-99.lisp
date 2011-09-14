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