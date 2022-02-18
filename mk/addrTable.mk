#################################################################################
# Clean
#################################################################################
clean_CM:
	@echo "Cleaning up address table autogenerated and downloaded files"
	@rm -f os/*.yaml
	@rm -f kernel/*.yaml
	@echo rm -rf $(shell find ./kernel/ -maxdepth 1 | grep "hw_" | grep -v "hw_user" | xargs)	
	@echo rm -rf $(shell find ./os/ -maxdepth 2 | grep "modules" | xargs)

clean_address_tables:
	@rm -rf os/address_table
#################################################################################
# address tables
#################################################################################
ADDRESS_TABLE ?= ${MAKE_PATH}/os/address_table/address_apollo.xml

#${ADDRESS_TABLE}: ${MAKE_PATH}/os/slaves.yaml
#	LD_LIBRARY_PATH+=/opt/cactus/lib ./scripts/BuildAddressTable.py -l ${MAKE_PATH}/os/slaves.yaml -t address_CM.xml -o os/address_table/Kintex_modules

${MAKE_PATH}/os/address_table/address_%.xml: ${MAKE_PATH}/os/slaves_%.yaml
	LD_LIBRARY_PATH+=/opt/cactus/lib ./scripts/BuildAddressTable.py -l $< -t address_$*.xml -o os/address_table/modules_$*/ -m modules_$*


address_table: ${ADDRESS_TABLE}
