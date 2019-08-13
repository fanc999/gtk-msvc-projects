# NMake Makefile portion for compilation rules
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.  The format
# of NMake Makefiles here are different from the GNU
# Makefiles.  Please see the comments about these formats.

# Inference rules for compiling the .obj files.
# Used for libs and programs with more than a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.obj::
# 	$(CC)|$(CXX) $(cflags) /Fo$(destdir) /c @<<
# $<
# <<

{..\src\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\cairo\}.obj::
	$(CC) $(CAIRO_INCLUDES) $(BASE_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo\ /c @<<
$<
<<

# For QT, for now
{..\src\}.cpp{vs$(VSVER)\$(CFG)\$(PLAT)\cairo\}.obj::
	$(CXX) $(CAIRO_QT_INCLUDES) $(BASE_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo\ /c @<<
$<
<<

{..\src\win32\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\cairo\}.obj::
	$(CC) $(CAIRO_INCLUDES) $(BASE_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo\ /c @<<
$<
<<

{..\util\cairo-script\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\cairo-script\}.obj::
	$(CC) $(CAIRO_SCRIPT_CFLAGS) $(BASE_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo-script\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo-script\ /c @<<
$<
<<

{..\util\cairo-gobject\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\cairo-gobject\}.obj::
	$(CC) $(CAIRO_GOBJECT_INCLUDES) $(BASE_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo-gobject\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo-gobject\ /c @<<
$<
<<

{..\boilerplate\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\}.obj::
	$(CC) $(CAIRO_BOILERPLATE_INCLUDES) $(BASE_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\ /c @<<
$<
<<

{..\boilerplate\}.cpp{vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\}.obj::
	$(CXX) $(CAIRO_BOILERPLATE_INCLUDES) $(BASE_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\ /c @<<
$<
<<

vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\cairo-boilerplate-constructors.obj: vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\cairo-boilerplate-constructors.c
	$(CC) $(CAIRO_BOILERPLATE_INCLUDES) $(BASE_CFLAGS) /Fo$(@D)\ /Fd$(@D)\ /c @<<
$**
<<

{..\test\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\}.obj::
	$(CC) $(CAIRO_TEST_INCLUDES) $(CAIRO_TEST_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\ /c @<<
$<
<<

{..\test\pdiff\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\}.obj::
	$(CC) $(CAIRO_TEST_INCLUDES) $(CAIRO_TEST_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\ /c @<<
$<
<<

vs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\cairo-test-constructors.obj: vs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\cairo-test-constructors.c
	$(CC) $(CAIRO_TEST_INCLUDES) $(CAIRO_TEST_CFLAGS) /Fo$(@D)\ /Fd$(@D)\ /c @<<
$**
<<

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]
{..\util\cairo-script\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\}.exe:
	@if not exist $(CAIRO_SCRIPT_INTERPRETER_LIB) $(MAKE) /f Makefile.vc $(CAIRO_MAKE_OPTIONS) $(CAIRO_SCRIPT_INTERPRETER_LIB)
	$(CC) $(CAIRO_SCRIPT_CFLAGS) $(BASE_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\cairo-script\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\cairo-script\ /Fe$@ $< /link $(LDFLAGS) $(CAIRO_SCRIPT_INTERPRETER_LIB) $(CAIRO_LIB) $(CAIRO_DEP_LIBS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Rules for building .lib files
$(CAIRO_LIB): vs$(VSVER)\$(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo$(CAIRO_DLL_SUFFIX).dll
$(CAIRO_GOBJECT_LIB): vs$(VSVER)\$(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo-gobject$(CAIRO_DLL_SUFFIX).dll
$(CAIRO_SCRIPT_INTERPRETER_LIB): vs$(VSVER)\$(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo-script-interpreter$(CAIRO_DLL_SUFFIX).dll

vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate.lib: $(CAIRO_LIB) vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\cairo-boilerplate-constructors.c $(cairo_boilerplate_OBJS)
	lib $(ARFLAGS) $(cairo_boilerplate_OBJS) /out:$@

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
vs$(VSVER)\$(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo$(CAIRO_DLL_SUFFIX).dll: vs$(VSVER)\$(CFG)\$(PLAT)\cairo\cairo-features.h $(cairo_dll_OBJS)
	link /DLL $(QT_ADDITIONAL_LDFLAGS) $(LDFLAGS) $(CAIRO_DEP_LIBS) -out:$@ /implib:vs$(VSVER)\$(CFG)\$(PLAT)\cairo.lib @<<
$(cairo_dll_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

vs$(VSVER)\$(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo-gobject$(CAIRO_DLL_SUFFIX).dll: $(CAIRO_LIB) vs$(VSVER)\$(CFG)\$(PLAT)\cairo-gobject $(cairo_gobject_dll_OBJS)
	link /DLL $(LDFLAGS) $(CAIRO_GOBJECT_DEP_LIBS) -out:$@ /implib:vs$(VSVER)\$(CFG)\$(PLAT)\cairo-gobject.lib @<<
$(cairo_gobject_dll_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

vs$(VSVER)\$(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo-script-interpreter$(CAIRO_DLL_SUFFIX).dll: $(CAIRO_LIB) vs$(VSVER)\$(CFG)\$(PLAT)\cairo-script\config.h $(cairo_script_dll_OBJS)
	link /DLL $(LDFLAGS) $(CAIRO_LIB) $(CAIRO_DEP_LIBS) -out:$@ /implib:vs$(VSVER)\$(CFG)\$(PLAT)\cairo-script-interpreter.lib @<<
$(cairo_script_dll_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

vs$(VSVER)\$(CFG)\$(PLAT)\cairo-test-suite.exe: vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate.lib $(CAIRO_LIB) $(cairo_test_OBJS) $(libpdiff_OBJS)
	link $(LDFLAGS) $(CAIRO_DEP_LIBS) -out:$@ @<<
$**
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

vs$(VSVER)\$(CFG)\$(PLAT)\perceptualdiff.exe: $(CAIRO_LIB) $(pdiff_OBJS) $(libpdiff_OBJS)
	link $(LDFLAGS) $(CAIRO_DEP_LIBS) -out:$@ @<<
$**
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1


# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Other .obj files requiring individual attention, that could not be covered by the inference rules.
# Format is as follows (all dirs must have a trailing '\'):
#
# $(obj_file):
# 	$(CC)|$(CXX) $(cflags) /Fo$(obj_destdir) /c @<<
# $(srcfile)
# <<

print-build-config:
	@echo.
	@echo ====================================
	@echo Build configuration for Cairo:
	@echo.
	@echo Build type:
	@echo $(CFG)
	@echo.
	@echo Built Tools:
	@if not "$(CAIRO_UTILS)" == "" for %t in ($(CAIRO_UTILS)) do @echo %~nt
	@echo.
	@echo Enabled Surface Backends:
	@echo $(ENABLED_SURFACE_BACKENDS)
	@echo.
	@echo Enabled Font Backends:
	@echo $(ENABLED_FONT_BACKENDS)
	@echo.
	@echo Enabled Options:
	@echo $(ENABLED_OPTIONS)
	@echo ====================================

clean:
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.lib
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.exe.manifest
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.exe
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.dll.manifest
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.dll
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.ilk
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-tests\cairo-test-constructors.c
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-boilerplate\cairo-boilerplate-constructors.c
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-script\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-script\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-script\config.h
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-gobject\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo-gobject\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\cairo\cairo-features.h
	@-rmdir /s /q vs$(VSVER)\$(CFG)\$(PLAT)
