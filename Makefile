MAKEFLAGS += -Rr

.SUFFIX:

PVER := "python3"
LOCAL_GOALS := lint

.PHONY: $(LOCAL_GOALS)

build $(filter-out $(LOCAL_GOALS),$(MAKECMDGOALS)): venv
	. venv/bin/activate && $(MAKE) -C docs $(MAKECMDGOALS)

lint: venv
	. venv/bin/activate && sphinx-lint docs/source

venv: requirements.txt
	$(PVER) -m venv venv
	. venv/bin/activate && pip install -r requirements.txt

