(defsystem "__PROJECT-NAME__"
  :version "0.0.1"
  :author ""
  :license "GNU GPLv3"
  :depends-on ()
  :components ((:module src
		:components
		((:file "package")
		 (:file "main"))))
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
