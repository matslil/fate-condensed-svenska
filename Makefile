MAKEFLAGS += -Rr

.SUFFIX:

# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     := docs
BUILDDIR      := build
PVER := "python3"

.PHONY:lint help

# Put it first so that "make" without argument is like "make help".
help: venv
	. venv/bin/activate && @$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

lint: venv
	. venv/bin/activate && sphinx-lint docs/$(SOURCEDIR)

venv: requirements.txt
	$(PVER) -m venv venv
	. venv/bin/activate && pip install -r requirements.txt

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile venv
	. venv/bin/activate && $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

