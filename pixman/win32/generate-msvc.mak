# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Create the build directories
$(CFG)\$(PLAT)\pixman-1	\
$(CFG)\$(PLAT)\pixman-ex	\
$(CFG)\$(PLAT)\pixman-tests:
	@-md $@

$(CFG)\$(PLAT)\pixman-1\pixman-1.def: ..\pixman\pixman.symbols $(CFG)\$(PLAT)\pixman-1
	@echo EXPORTS > $@
	$(CPP) /EP ..\pixman\pixman.symbols >> $@

$(CFG)\$(PLAT)\pixman-ex\config.h: $(CFG)\$(PLAT)\pixman-ex
	@echo /* simple config.h to build the GTK+ examples */ > $@