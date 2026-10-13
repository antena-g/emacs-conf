EMACS=emacs
FILES=__PROJECT-NAME__.el

.PHONY: help package elpa clean make-test compile-test test lint

help:
	@printf "\
Main targets\n\
compile    -- compile .el files\n\
elpa 	   -- create a package with the elpa format \n\
package    -- create a tar.gz file with the .el files \n\
test       -- run tests in batch mode\n\
clean      -- delete generated files\n\
lint       -- run package-lint in batch mode\n\
help       -- print this message\n"

package: *.el
	@ver=`grep -o "Version: .*" __PROJECT-NAME__.el | cut -c 10-`; \
	tar czvf __PROJECT-NAME__-$$ver.tar.gz --mode 644 $$(find . -name \*.el)

elpa: *.el
	@version=`grep -o "Version: .*" __PROJECT-NAME__.el | cut -c 10-`; \
	dir=__PROJECT-NAME__-$$version; \
	mkdir -p "$$dir"; \
	cp $$(find . -name \*.el) __PROJECT-NAME__-$$version; \
	echo "(define-package \"__PROJECT-NAME__\" \"$$version\" \
	\"Modular in-buffer completion framework\")" \
	> "$$dir"/__PROJECT-NAME__-pkg.el; \
	tar cvf __PROJECT-NAME__-$$version.tar --mode 644 "$$dir"

clean:
	@rm -rf __PROJECT-NAME__-*/ __PROJECT-NAME__-*.tar __PROJECT-NAME__-*.tar.bz2 *.elc ert.el .elpa/

make-test:
	${EMACS}  --batch -l test/make-install.el -l test/make-test.el 

test: make-test clean

compile:
	${EMACS} --batch  -l test/make-install.el -L . -f batch-byte-compile __PROJECT-NAME__.el __PROJECT-NAME__*-.el

compile-test: compile clean

lint:
	${EMACS} --batch -l test/make-install.el -f package-lint-batch-and-exit ${FILES}
