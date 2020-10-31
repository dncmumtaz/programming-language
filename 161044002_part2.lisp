(defvar firstNumber 11)
(defvar secondNumber 65)

(defun mainn()
	(loop for a from firstNumber to secondNumber
			
			do	
			(if (equal (primep a) T)

				(writee "primedistribution.txt" a)
				)
			(if (equal (semiprimep a) T)
				(writeeSemiprime "primedistribution.txt" a)
				)
			)
	)

(defun semiprimep (n &optional (a 2))
	(cond ((> a (isqrt n)) nil)
		((zerop (rem n a)) (and (primep a) (primep (/ n a))))
		(t (semiprimep n (+ a 1)))))

(defun primep (n &optional (a 2))
	(cond ((> a (isqrt n)) t)
		((zerop (rem n a)) nil)
		(t (primep n (+ a 1)))))


(defun read-file (infile)
	(with-open-file (instream infile :direction :input  :if-does-not-exist  nil)
		(when instream 
			(let ((string (make-string (file-length instream))))
				(read-sequence string instream)
				string))))

(defun line-as-list (line)
	(read-from-string (concatenate 'string "(" line ")"))
	)


(defun writee(filename abc)
(with-open-file (str filename

                     :direction :output
                     :if-exists :append
                     :if-exists :supersede
                     :if-does-not-exist :create

                     )
  (format str "~a is Prime~%" abc)))

(defun writeeSemiprime(filename abc)
(with-open-file (str filename

                     :direction :output
                     :if-exists :append
                     :if-exists :supersede
                     :if-does-not-exist :create

                     )
  (format str "~a is Semi-prime~%" abc)))

(setf linee (read-file "boundries.txt"))
(setf newList (line-as-list linee))

(setf firstNumber (car newList))
(setf secondNumber (nth 1  newList))


(mainn)
