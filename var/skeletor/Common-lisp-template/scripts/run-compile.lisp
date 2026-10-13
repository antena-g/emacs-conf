(require :asdf)

(asdf:load-system :__PROJECT-NAME__)
(asdf:load-system :__PROJECT-NAME__/tests)

(asdf:make :__PROJECT-NAME__)
(asdf:make :__PROJECT-NAME__)

(quit)
