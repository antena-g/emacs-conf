(require :asdf)

(asdf:load-system :__PROJECT-NAME__)
(asdf:load-system :__PROJECT-NAME__/tests)

;; Insert 5am project suite name
;; (5am:run! ...)

(quit)
