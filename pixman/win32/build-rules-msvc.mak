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

{..\pixman\}.c{$(CFG)\$(PLAT)\pixman-1\}.obj::
	$(CC) $(PIXMAN_INCLUDES) $(PIXMAN_LIB_CFLAGS) /Fo$(CFG)\$(PLAT)\pixman-1\ /c @<<
$<
<<

{..\test\}.c{$(CFG)\$(PLAT)\pixman-tests\}.obj::
	$(CC) $(PIXMAN_INCLUDES) $(PIXMAN_TEST_CFLAGS) /Fo$(CFG)\$(PLAT)\pixman-tests\ /c @<<
$<
<<

{..\demos\}.c{$(CFG)\$(PLAT)\pixman-ex\}.obj::
	$(CC) $(PIXMAN_DEMO_INCLUDES) $(PIXMAN_DEMO_CFLAGS) /Fo$(CFG)\$(PLAT)\pixman-ex\ /c @<<
$<
<<

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]
{..\test\}.c{$(CFG)\$(PLAT)\}.exe:
	@if not exist $(PIXMAN_LIB) $(MAKE) /f Makefile.vc CFG=$(CFG) $(PIXMAN_LIB)
	@if not exist $(CFG)\$(PLAT)\pixman-tests $(MAKE) /f Makefile.vc CFG=$(CFG) $(CFG)\$(PLAT)\pixman-tests
	@if not exist $(CFG)\$(PLAT)\pixman-tests\utils-prng.obj $(MAKE) /f Makefile.vc CFG=$(CFG) $(CFG)\$(PLAT)\pixman-tests\utils-prng.obj
	@if not exist $(CFG)\$(PLAT)\pixman-tests\utils.obj $(MAKE) /f Makefile.vc CFG=$(CFG) $(CFG)\$(PLAT)\pixman-tests\utils.obj
	$(CC) $(PIXMAN_INCLUDES) $(PIXMAN_TEST_CFLAGS) /Fo$(CFG)\$(PLAT)\pixman-tests\ /Fe$@ $<	\
	/link $(LDFLAGS) $(pixman_test_util_OBJS) $(PIXMAN_LIB)

{..\demos\}.c{$(CFG)\$(PLAT)\}.exe:
	@if not exist $(PIXMAN_LIB) $(MAKE) /f Makefile.vc CFG=$(CFG) $(PIXMAN_LIB)
	@if not exist $(CFG)\$(PLAT)\pixman-ex\config.h $(MAKE) /f Makefile.vc CFG=$(CFG) $(CFG)\$(PLAT)\pixman-ex\config.h
	@if not exist $(CFG)\$(PLAT)\pixman-tests $(MAKE) /f Makefile.vc CFG=$(CFG) $(CFG)\$(PLAT)\pixman-tests
	@if not exist $(CFG)\$(PLAT)\pixman-ex\gtk-utils.obj $(MAKE) /f Makefile.vc CFG=$(CFG) $(CFG)\$(PLAT)\pixman-ex\gtk-utils.obj
	@if not exist $(CFG)\$(PLAT)\pixman-tests\utils-prng.obj $(MAKE) /f Makefile.vc CFG=$(CFG) $(CFG)\$(PLAT)\pixman-tests\utils-prng.obj
	@if not exist $(CFG)\$(PLAT)\pixman-tests\utils.obj $(MAKE) /f Makefile.vc CFG=$(CFG) $(CFG)\$(PLAT)\pixman-tests\utils.obj
	$(CC) $(PIXMAN_DEMO_INCLUDES) $(PIXMAN_DEMO_CFLAGS) /Fo$(CFG)\$(PLAT)\pixman-ex\ /Fe$@ $<	\
	/link $(LDFLAGS) $(pixman_gtk2_demo_util_OBJS) $(PIXMAN_DEMO_DEP_LIBS) $(PIXMAN_LIB)

# Rules for building .lib files
$(PIXMAN_LIB): $(CFG)\$(PLAT)\pixman-1.dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\pixman-1.dll: $(CFG)\$(PLAT)\pixman-1\pixman-1.def $(pixman_1_OBJS)
	link /DLL $(LDFLAGS) -out:$@ /def:$(CFG)\$(PLAT)\$(@B)\$(@B).def @<<
$(pixman_1_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

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
	@-if exist $(CFG)\$(PLAT)\pixman-ex del /f /q $(CFG)\$(PLAT)\pixman-ex\*.obj
	@-if exist $(CFG)\$(PLAT)\pixman-ex del /f /q $(CFG)\$(PLAT)\pixman-ex\config.h
	@-del /f /q $(CFG)\$(PLAT)\pixman-tests\*.obj
	@-del /f /q $(CFG)\$(PLAT)\pixman-1\*.obj
	@-del /f /q $(CFG)\$(PLAT)\pixman-1\pixman-1.def
	@-del /f /q vc$(PDBVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
