# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Create the build directories
$(CFG)\$(PLAT)\sqlite3-dll	\
$(CFG)\$(PLAT)\tcl-sqlite3	\
$(CFG)\$(PLAT)\sqlite3:
	@-md $@

$(CFG)\$(PLAT)\sqlite3-dll\version: $(CFG)\$(PLAT)\nmakehlp.exe $(CFG)\$(PLAT)\sqlite3-dll
	$(CFG)\$(PLAT)\nmakehlp.exe -V ..\configure.ac AC_INIT > $@

$(CFG)\$(PLAT)\sqlite3-dll\sqlite3rc.h: $(CFG)\$(PLAT)\sqlite3-dll\version
	@echo #ifndef SQLITE_RESOURCE_VERSION > $@
	@echo #define SQLITE_RESOURCE_VERSION $(SQLITE3_VER_RSRC) >> $@
	@echo #endif >> $@
