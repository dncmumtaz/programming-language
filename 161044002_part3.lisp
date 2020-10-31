(setq myList '(()) )
(defvar aa 1)
(defun collatz (n)
	(progn
		(push n (nth 0 myList))
	 ; (print n)
	  (writee "collatz_outputs.txt" n)
	 (cond
	 	((= n 1) n)
	 	((= (mod n 2) 0) (collatz (/ n 2)))
	 	((= (mod n 2) 1) (collatz (+ 1 (* n 3)))))))

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
		;:if-exists :supersede
		:if-does-not-exist :create

		)
	(format str "~a " abc)))

(defun writeeInitialize(filename abc)
	(with-open-file (str filename

		:direction :output
		:if-exists :append
		;:if-exists :supersede
		:if-does-not-exist :create

		)
	(format str "~a: " abc)))

(defun writeeDownLine(filename)
	(with-open-file (str filename

		:direction :output
		:if-exists :append
		:if-exists :supersede
		:if-does-not-exist :create

		)
	(format str "~%")))

(defun mainn()

	(loop for a from 0 to secondNumber
		do			
		(writeeInitialize "collatz_outputs.txt" (nth a newList))
		(collatz (nth a newList) )
		(writeeDownLine "collatz_outputs.txt")
		)
	)

(setf linee (read-file "integer_inputs.txt"))
(setf newList (line-as-list linee))

(if( > (length newList) 5 )
	(setq secondNumber 4)
	(setq secondNumber (length newList))
	)

(mainn)
