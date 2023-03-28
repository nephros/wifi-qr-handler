
QMLFILES := $(shell find b/ -name "*.qml")
JSONLINT := python -m json.tool
QMLLINT := $(shell find /usr/lib*/qt5/bin -name qmllint)

.PRECIOUS: patch.json $(QMLFILES)
.PHONY: check

all: check meta patch

check: check-json check-qml
meta: patch.json
patch: check-patch

unified_diff.patch: $(QMLFILES)
	@echo generating $@...
	@diff -Naur a b > $@ ; [ $$? -eq 1 ] # NOTE: diff exits 1 if it found differences

check-qml: $(QMLFILES)
	@echo validating $<...
	@$(QMLLINT) $<

check-json: patch.json
	@echo validating $<...
	@$(JSONLINT) $< /dev/null

check-patch: unified_diff.patch
	@echo validating $<...
	@patch -s -p1 -d / --dry-run --no-backup-if-mismatch < $< >/dev/null

clean:
	@-$(RM) unified_diff.patch
