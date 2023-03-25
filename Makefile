TOP := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

build $(MAKECMDGOALS): $(TOP)/venv/bin/sphinx-build
	. $(TOP)/venv/bin/activate && $(MAKE) -C docs $(MAKECMDGOALS)

$(TOP)/venv/bin/sphinx%: $(TOP)/venv
	. $(TOP)/venv/bin/activate && pip install sphinx

$(TOP)/venv:
	python3 -m venv venv


