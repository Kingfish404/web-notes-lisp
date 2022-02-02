;; import lib
(ql:quickload '(hunchentoot cl-json cl-prevalence))

;; setting
(defvar port 3000)
(defvar root #p"www/")
(defvar storage-root #p"storage-temp/")

;; start server
(hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port port :document-root root))

;; util get time string
(defun current-time-string ()
  (multiple-value-bind (sec min hr day mon yr dow dst-p tz)
                       (get-decoded-time)
    (declare (ignore dow dst-p tz))
    (format nil "~4,'0d-~2,'0d-~2,'0d-~2,'0dh-~2,'0dm-~2,'0ds" yr mon day hr min sec)))

;; define class of note, key is id
(defclass note()
  ((id :reader id
       :initarg :id)
   (value :accessor value
         :initarg :value)
   (date :accessor date
        :initarg :date)))

;; init prevalence-system storage
(defvar *note-list* (cl-prevalence:make-prevalence-system storage-root))
;; init memory storage
(or (> (length (cl-prevalence:find-all-objects *note-list* 'note)) 0)
	(cl-prevalence:tx-create-id-counter *note-list*))

;; serve create a note object
(defun make-note (value)
  (progn 
  (cl-prevalence:tx-create-object
    *note-list* 'note
    `((value ,value) (date ,(format nil (current-time-string)))))
  (cl-prevalence:snapshot *note-list*)))

;; serve delete a note object
(defun delete-note (id)
  (progn
    (cl-prevalence:tx-delete-object
      *note-list* 'note (parse-integer id))
    (cl-prevalence:snapshot *note-list*)))

;; api create a note object and return as json format
(hunchentoot:define-easy-handler (add-api :uri "/api/add") (value)
  (setf (hunchentoot:content-type*) "application/json")
  (json:encode-json-to-string (make-note value)))

;; api delete a note object by id
(hunchentoot:define-easy-handler (delete-api :uri "/api/delete") (id)
  (setf (hunchentoot:content-type*) "application/json")
  (json:encode-json-to-string (delete-note id)))

;; api get note list
(hunchentoot:define-easy-handler (notes :uri "/api/notes") ()
  (setf (hunchentoot:content-type*) "application/json")
  (json:encode-json-to-string
   (cl-prevalence:find-all-objects *note-list* 'note)))

;; Persistent data
;;(cl-prevalence:snapshot *note-list*)

(write-line (format nil "ready - started server on 0.0.0.0:~a, url: http://localhost:~a" port port))
(write-line (format nil "info  - site root at ./~a, data store at ./~a" root storage-root))
