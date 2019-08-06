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

{..\src\}.c{$(CFG)\$(PLAT)\cairo\}.obj::
	$(CC) $(CAIRO_INCLUDES) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo\ /Fd$(CFG)\$(PLAT)\cairo\ /c @<<
$<
<<

# For QT, for now
{..\src\}.cpp{$(CFG)\$(PLAT)\cairo\}.obj::
	$(CXX) $(CAIRO_QT_INCLUDES) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo\ /Fd$(CFG)\$(PLAT)\cairo\ /c @<<
$<
<<

{..\src\win32\}.c{$(CFG)\$(PLAT)\cairo\}.obj::
	$(CC) $(CAIRO_INCLUDES) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo\ /Fd$(CFG)\$(PLAT)\cairo\ /c @<<
$<
<<

{..\util\cairo-script\}.c{$(CFG)\$(PLAT)\cairo-script\}.obj::
	$(CC) $(CAIRO_SCRIPT_CFLAGS) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo-script\ /Fd$(CFG)\$(PLAT)\cairo-script\ /c @<<
$<
<<

{..\util\cairo-gobject\}.c{$(CFG)\$(PLAT)\cairo-gobject\}.obj::
	$(CC) $(CAIRO_GOBJECT_INCLUDES) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo-gobject\ /Fd$(CFG)\$(PLAT)\cairo-gobject\ /c @<<
$<
<<

{..\boilerplate\}.c{$(CFG)\$(PLAT)\cairo-boilerplate\}.obj::
	$(CC) $(CAIRO_BOILERPLATE_INCLUDES) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo-boilerplate\ /Fd$(CFG)\$(PLAT)\cairo-boilerplate\ /c @<<
$<
<<

{..\boilerplate\}.cpp{$(CFG)\$(PLAT)\cairo-boilerplate\}.obj::
	$(CXX) $(CAIRO_BOILERPLATE_INCLUDES) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo-boilerplate\ /Fd$(CFG)\$(PLAT)\cairo-boilerplate\ /c @<<
$<
<<

$(CFG)\$(PLAT)\cairo-boilerplate\cairo-boilerplate-constructors.obj: $(CFG)\$(PLAT)\cairo-boilerplate\cairo-boilerplate-constructors.c
	$(CC) $(CAIRO_BOILERPLATE_INCLUDES) $(BASE_CFLAGS) /Fo$(@D)\ /Fd$(@D)\ /c @<<
$**
<<

{..\test\}.c{$(CFG)\$(PLAT)\cairo-tests\}.obj::
	$(CC) $(CAIRO_TEST_INCLUDES) $(CAIRO_TEST_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo-tests\ /Fd$(CFG)\$(PLAT)\cairo-tests\ /c @<<
$<
<<

{..\test\pdiff\}.c{$(CFG)\$(PLAT)\cairo-tests\}.obj::
	$(CC) $(CAIRO_TEST_INCLUDES) $(CAIRO_TEST_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo-tests\ /Fd$(CFG)\$(PLAT)\cairo-tests\ /c @<<
$<
<<

$(CFG)\$(PLAT)\cairo-tests\cairo-test-constructors.obj: $(CFG)\$(PLAT)\cairo-tests\cairo-test-constructors.c
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
{..\util\cairo-script\}.c{$(CFG)\$(PLAT)\}.exe:
	@if not exist $(CAIRO_SCRIPT_INTERPRETER_LIB) $(MAKE) /f Makefile.vc $(CAIRO_MAKE_OPTIONS) $(CAIRO_SCRIPT_INTERPRETER_LIB)
	$(CC) $(CAIRO_SCRIPT_CFLAGS) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\cairo-script\ /Fd$(CFG)\$(PLAT)\cairo-script\ /Fe$@ $< /link $(LDFLAGS) $(CAIRO_SCRIPT_INTERPRETER_LIB) $(CAIRO_LIB) $(CAIRO_DEP_LIBS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Rules for building .lib files
$(CAIRO_LIB): $(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo$(CAIRO_DLL_SUFFIX).dll
$(CAIRO_GOBJECT_LIB): $(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo-gobject$(CAIRO_DLL_SUFFIX).dll
$(CAIRO_SCRIPT_INTERPRETER_LIB): $(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo-script-interpreter$(CAIRO_DLL_SUFFIX).dll

$(CFG)\$(PLAT)\cairo-boilerplate.lib: $(CAIRO_LIB) $(CFG)\$(PLAT)\cairo-boilerplate\cairo-boilerplate-constructors.c $(cairo_boilerplate_OBJS)
	lib $(ARFLAGS) $(cairo_boilerplate_OBJS) /out:$@

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo$(CAIRO_DLL_SUFFIX).dll: $(CFG)\$(PLAT)\cairo\cairo-features.h $(cairo_dll_OBJS)
	link /DLL $(QT_ADDITIONAL_LDFLAGS) $(LDFLAGS) $(CAIRO_DEP_LIBS) -out:$@ /implib:$(CFG)\$(PLAT)\cairo.lib @<<
$(cairo_dll_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo-gobject$(CAIRO_DLL_SUFFIX).dll: $(CAIRO_LIB) $(CFG)\$(PLAT)\cairo-gobject $(cairo_gobject_dll_OBJS)
	link /DLL $(LDFLAGS) $(CAIRO_GOBJECT_DEP_LIBS) -out:$@ /implib:$(CFG)\$(PLAT)\cairo-gobject.lib @<<
$(cairo_gobject_dll_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\$(CAIRO_DLL_PREFIX)cairo-script-interpreter$(CAIRO_DLL_SUFFIX).dll: $(CAIRO_LIB) $(CFG)\$(PLAT)\cairo-script\config.h $(cairo_script_dll_OBJS)
	link /DLL $(LDFLAGS) $(CAIRO_LIB) $(CAIRO_DEP_LIBS) -out:$@ /implib:$(CFG)\$(PLAT)\cairo-script-interpreter.lib @<<
$(cairo_script_dll_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\cairo-test-suite.exe: $(CFG)\$(PLAT)\cairo-boilerplate.lib $(CAIRO_LIB) $(cairo_test_OBJS) $(libpdiff_OBJS)
	link $(LDFLAGS) $(CAIRO_DEP_LIBS) -out:$@ @<<
$**
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\perceptualdiff.exe: $(CAIRO_LIB) $(pdiff_OBJS) $(libpdiff_OBJS)
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

clean:
	@-del /f /q $(CFG)\$(PLAT)\*.lib
	@-del /f /q $(CFG)\$(PLAT)\*.pdb
	@-del /f /q $(CFG)\$(PLAT)\*.exe.manifest
	@-del /f /q $(CFG)\$(PLAT)\*.exe
	@-del /f /q $(CFG)\$(PLAT)\*.dll.manifest
	@-del /f /q $(CFG)\$(PLAT)\*.dll
	@-del /f /q $(CFG)\$(PLAT)\*.ilk
	@-del /f /q $(CFG)\$(PLAT)\cairo-tests\*.pdb
	@-del /f /q $(CFG)\$(PLAT)\cairo-tests\*.obj
	@-del /f /q $(CFG)\$(PLAT)\cairo-tests\cairo-test-constructors.c
	@-del /f /q $(CFG)\$(PLAT)\cairo-boilerplate\*.pdb
	@-del /f /q $(CFG)\$(PLAT)\cairo-boilerplate\*.obj
	@-del /f /q $(CFG)\$(PLAT)\cairo-boilerplate\cairo-boilerplate-constructors.c
	@-del /f /q $(CFG)\$(PLAT)\cairo-script\*.pdb
	@-del /f /q $(CFG)\$(PLAT)\cairo-script\*.obj
	@-del /f /q $(CFG)\$(PLAT)\cairo-script\config.h
	@-del /f /q $(CFG)\$(PLAT)\cairo-gobject\*.pdb
	@-del /f /q $(CFG)\$(PLAT)\cairo-gobject\*.obj
	@-del /f /q $(CFG)\$(PLAT)\cairo\*.pdb
	@-del /f /q $(CFG)\$(PLAT)\cairo\*.obj
	@-del /f /q $(CFG)\$(PLAT)\cairo\cairo-features.h
	@-rmdir /s /q $(CFG)\$(PLAT)
