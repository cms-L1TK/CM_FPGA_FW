SCRIPT_DIR = ./scripts
EVENTS_DIR = ./src/tracktrigger/emData/MemPrintsReduced/InputStubs
NUM_EVENTS = 20
INPUTS = $(wildcard $(EVENTS_DIR)/Link_*.dat)
OUTPUTS = $(patsubst %.dat,%.coe,$(INPUTS))

coe_gen: $(OUTPUTS)

%.coe: %.dat
	@echo "Generating .coe memory file '$@'"
	@python $(SCRIPT_DIR)/processMemory.py -i $< -n $(NUM_EVENTS)

clean_coe:
	@echo "Cleaning up .coe generated files"
	@find $(EVENTS_DIR) -type f -name '*.coe' -delete

.PHONY: clean_coe
