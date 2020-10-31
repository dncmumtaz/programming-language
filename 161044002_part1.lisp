(defun readingg(lin)
	(let ((in (open "nested_list.txt" :if-does-not-exist nil)))
		(when in
			(loop for lin = (read-line in nil)
				while lin do (format t "~a~%" lin))
			(setf line lin)
			(close in)))
	)

(defun flatten (ls)
	(labels ((mklist (x) (if (listp x) x (list x))))
		(mapcan #'(lambda (x) (if (atom x) (mklist x) (flatten x))) ls)))


(defun read-file (infile)
	(with-open-file (instream infile :direction :input  :if-does-not-exist  nil)
		(when instream 
			(let ((string (make-string (file-length instream))))
				(read-sequence string instream)
				string))))

(defun lineList (line)
	(read-from-string (concatenate 'string "(" line ")"))
	)
(defun writee(filename)
	(with-open-file (str filename
		:direction :output
		:if-exists :supersede
		:if-does-not-exist :create)
	(format str "~a ~%" abc)))

(setf linee (read-file "nested_list.txt"))
(setf newList (lineList linee))
(setf abc (flatten newList))

(writee "flattened_list.txt")



