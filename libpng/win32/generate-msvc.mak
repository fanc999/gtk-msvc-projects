# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Copy config.h from config.h.win32
pnglibconf.h: ..\scripts\pnglibconf.h.prebuilt
	@copy ..\scripts\$@.prebuilt $@

# Create the build directories
$(CFG)\$(PLAT)\libpng	\
$(CFG)\$(PLAT)\libpng-tools	\
$(CFG)\$(PLAT)\libpng-tests:
	@-md $@
