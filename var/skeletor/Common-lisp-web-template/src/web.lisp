(in-package :cl-user)
(defpackage __PROJECT-NAME__.web
  (:use :cl
        :caveman2
        :__PROJECT-NAME__.config
        :__PROJECT-NAME__.view
        :__PROJECT-NAME__.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :__PROJECT-NAME__.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
