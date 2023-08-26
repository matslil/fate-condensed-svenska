MAKEFLAGS += -Rr

.SUFFIX:

TOP := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

PVER := "python3"
SITE := $(TOP)/venv/lib/$(PVER)/site-packages

LOCAL_GOALS := lint

.PHONY: $(LOCAL_GOALS)

build $(filter-out $(LOCAL_GOALS),$(MAKECMDGOALS)): $(SITE)/sphinx
	. $(TOP)/venv/bin/activate && $(MAKE) -C docs $(MAKECMDGOALS)

lint: $(SITE)/sphinx_lint $(SITE)/MarkupSafe
	. $(TOP)/venv/bin/activate && sphinx-lint docs/source

$(SITE)/MarkupSafe:  $(TOP)/venv
	. $(TOP)/venv/bin/activate && pip install $(notdir $@)==2.0

$(SITE)/%:  $(TOP)/venv
	. $(TOP)/venv/bin/activate && pip install $(notdir $@)

$(TOP)/venv:
	$(PVER) -m venv venv


