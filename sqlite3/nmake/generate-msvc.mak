# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Create the build directories
$(CFG)\$(PLAT)\sqlite3-dll	\
$(CFG)\$(PLAT)\tcl-sqlite3	\
$(CFG)\$(PLAT)\sqlite3:
	@-md $@

$(CFG)\$(PLAT)\tcl-sqlite3\sqlite-version.h: $(CFG)\$(PLAT)\nmakehlp.exe
	$(CFG)\$(PLAT)\nmakehlp.exe -V ..\configure.ac AC_INIT > $(CFG)\$(PLAT)\tcl-sqlite3\version
	for /f "delims=" %%x in ($(CFG)\$(PLAT)\tcl-sqlite3\version) do echo #define PACKAGE_VERSION "%%x" > $@
