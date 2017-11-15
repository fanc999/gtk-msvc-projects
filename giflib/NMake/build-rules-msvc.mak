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

{..\lib\}.c{$(CFG)\$(PLAT)\giflib\}.obj::
	$(CC) $(GIFLIB_INCLUDES) $(GIFLIB_CFLAGS) /Fo$(CFG)\$(PLAT)\giflib\ /c @<<
$<
<<

{..\util\}.c{$(CFG)\$(PLAT)\giflib-utils\}.obj:
	@if not exist $(CFG)\$(PLAT)\giflib-utils mkdir $(CFG)\$(PLAT)\giflib-utils
	$(CC) $(GIFLIB_INCLUDES) $(GIFLIB_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\giflib-utils\ /c @<<
$<
<<

# Rules for building .rc files

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]
{..\util\}.c{$(CFG)\$(PLAT)\}.exe:
	@if not exist $(GIFLIB_LIB) $(MAKE) -f Makefile.vc CFG=$(CFG) $(GIFLIB_LIB)
	@for %%f in ($(giflib_getarg_OBJS)) do @if not exist %%f $(MAKE) -f Makefile.vc CFG=$(CFG) %%f
	@if not exist $(CFG)\$(PLAT)\giflib-utils mkdir $(CFG)\$(PLAT)\giflib-utils
	$(CC) $(GIFLIB_INCLUDES) $(GIFLIB_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\giflib-utils\ /Fe$@ $< /link $(LDFLAGS) $(GIFLIB_LIB) $(giflib_getarg_OBJS)

# Rules for building .lib files
$(GIFLIB_LIB): $(CFG)\$(PLAT)\libgif.dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\libgif.dll: $(CFG)\$(PLAT)\giflib $(giflib_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(giflib_OBJS)
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
	@-del /f /q $(CFG)\$(PLAT)\giflib-utils\*.obj
	@-del /f /q $(CFG)\$(PLAT)\giflib\*.obj
	@-del /f /q vc$(VSVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
