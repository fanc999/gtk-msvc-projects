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

{..\}.c{$(CFG)\$(PLAT)\libpng\}.obj::
	$(CC) $(LIBPNG_CFLAGS) $(LIBPNG_INCLUDES) /Fo$(CFG)\$(PLAT)\libpng\ /c @<<
$<
<<

# Rules for building .rc files
$(CFG)\$(PLAT)\libpng\pngwin.res: ..\scripts\pngwin.rc
	rc /fo$@ ..\scripts\$(@B).rc

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]
{..\contrib\tools\}.c{$(CFG)\$(PLAT)\}.exe:
	@if not exist $(PNG_LIB) $(MAKE) Makefile.vc CFG=$(CFG)
	@if not exist $(CFG)\$(PLAT)\libpng-tools mkdir $(CFG)\$(PLAT)\libpng-tools
	$(CC) $(LIBPNG_CFLAGS) $(PNG_INCLUDES) /Fo$(CFG)\$(PLAT)\libpng-tools\ /Fe$@ $< /link $(LDFLAGS) $(PNG_LIB) $(LIBPNG_DEP_LIBS)

{..\contrib\libtests\}.c{$(CFG)\$(PLAT)\}.exe:
	@if not exist $(PNG_LIB) $(MAKE) Makefile.vc CFG=$(CFG)
	@if not exist $(CFG)\$(PLAT)\libpng-tests mkdir $(CFG)\$(PLAT)\libpng-tests
	$(CC) $(LIBPNG_CFLAGS) $(PNG_INCLUDES) /Fo$(CFG)\$(PLAT)\libpng-tests\ /Fe$@ $< /link $(LDFLAGS) $(PNG_LIB) $(LIBPNG_DEP_LIBS)

{..\}.c{$(CFG)\$(PLAT)\}.exe:
	@if not exist $(PNG_LIB) $(MAKE) Makefile.vc CFG=$(CFG)
	@if not exist $(CFG)\$(PLAT)\libpng-tests mkdir $(CFG)\$(PLAT)\libpng-tests
	$(CC) $(LIBPNG_CFLAGS) $(PNG_INCLUDES) /Fo$(CFG)\$(PLAT)\libpng-tests\ /Fe$@ $< /link $(LDFLAGS) $(PNG_LIB) $(LIBPNG_DEP_LIBS)

# Rules for building .lib files
$(PNG_LIB): $(CFG)\$(PLAT)\libpng$(PNG_RELEASE_SERIES).dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\libpng$(PNG_RELEASE_SERIES).dll: pnglibconf.h $(CFG)\$(PLAT)\libpng $(libpng_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(LIBPNG_DEP_LIBS) $(libpng_OBJS)
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
	@-del /f /q $(CFG)\$(PLAT)\libpng-tests\*.obj
	@-del /f /q $(CFG)\$(PLAT)\libpng-tools\*.obj
	@-del /f /q $(CFG)\$(PLAT)\libpng\*.obj
	@-del /f /q pnglibconf.h
	@-del /f /q png*.png
	@-del /f /q png*.out
	@-del /f /q vc$(VSVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
