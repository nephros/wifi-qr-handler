
#QMLFILES := $(shell find b/ -name "*.qml" 2>/dev/null)
PATCH := unified_diff.patch
QMLFILES := $(shell awk '/^\+\+\+ / {print $$2}' $(PATCH) |xargs echo)
JSONLINT := python3 -m json.tool
QMLLINT := $(shell find /usr/lib*/qt5/bin -name qmllint 2>/dev/null)

.PRECIOUS: patch.json $(QMLFILES)
.PHONY: check $(QMLFILES)

all: check meta patch

check: check-json check-qml
meta: patch.json
patch: $(PATCH) check-patch

$(PATCH): $(QMLFILES)
	@echo generating $@...
	@test -d a && test -d b && diff -Naur a b > $@ ; [ $$? -eq 1 ] # NOTE: diff exits 1 if it found differences

check-qml: $(QMLFILES)
	@echo validating $?...
	@$(QMLLINT) $?

check-json: patch.json
	@echo validating $<...
	@$(JSONLINT) $< /dev/null

check-patch: $(PATCH)
	@echo validating $?...
	@patch -s -p1 -d / --dry-run --no-backup-if-mismatch < $? >/dev/null

clean:
	@-$(RM) $(PATCH)
