(defsystem "__PROJECT-NAME__"
  :version "0.0.1"
  :author ""
  :license "GNU GPLv3"
  :depends-on ("clack"
               "lack"
               "caveman2"
               "envy"
               "cl-ppcre"
               "uiop"

               ;; for @route annotation
               "cl-syntax-annot"

               ;; HTML Template
               "djula"

               ;; for DB
               "datafly"
               "sxql")
  :components ((:module src
		:components
		((:file "package")
		 (:file "main" :depends-on ("config" "view" "db"))
		 (:file "web" :depends-on ("view"))
		 (:file "view" :depends-on ("config"))
		 (:file "db" :depends-on ("config"))
		 (:file "config"))))
  :description "")


(defsystem "__PROJECT-NAME__/tests"
  :author ""
  :license "GNU GPLv3"
  :depends-on (:__PROJECT-NAME__ :fiveam)
  :components ((:module tests
		:serial t
		:components
		((:file "package")
		 (:file "tests"))))
  :description "Test system for __PROJECT-NAME__")
