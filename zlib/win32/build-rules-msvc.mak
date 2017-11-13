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

{..\}.c{$(CFG)\$(PLAT)\zlib\}.obj::
	$(CC) $(ZLIB_INCLUDES) $(ZLIB_CFLAGS) /Fo$(CFG)\$(PLAT)\zlib\ /c @<<
$<
<<

{..\contrib\masmx64\}.c{$(CFG)\$(PLAT)\zlib\}.obj::
	$(CC) $(ZLIB_INCLUDES) $(ZLIB_CFLAGS) $(ZLIB_CFLAGS) /Fo$(CFG)\$(PLAT)\zlib\ /c @<<
$<
<<


{..\contrib\masmx64\}.asm{$(CFG)\$(PLAT)\zlib\}.obj:
	$(AS) $(ZLIB_INCLUDES) $(ASM_FLAGS) /Fo$(CFG)\$(PLAT)\zlib\ $< /c

{..\contrib\masmx86\}.asm{$(CFG)\$(PLAT)\zlib\}.obj:
	$(AS) $(ZLIB_INCLUDES) $(ASM_FLAGS) /Fo$(CFG)\$(PLAT)\zlib\ $< /c

# Rules for building .rc files
$(CFG)\$(PLAT)\zlib\zlib1.res: zlib1.rc
	rc /fo$@ $(@B).rc

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]
{..\test\}.c{$(CFG)\$(PLAT)\}.exe:
	@if not exist $(ZLIB_LIB) $(MAKE) -f Makefile.vc CFG=$(CFG) $(NMAKE_SAVED_OPTS)
	@if not exist $(CFG)\$(PLAT)\zlib-tests mkdir $(CFG)\$(PLAT)\zlib-tests
	$(CC) $(ZLIB_INCLUDES) $(ZLIB_CFLAGS) $(ZLIB_CFLAGS) /Fo$(CFG)\$(PLAT)\zlib-tests\ /Fe$@ $< /link $(LDFLAGS) $(ZLIB_LIB)

# Rules for building .lib files
$(ZLIB_LIB): $(CFG)\$(PLAT)\zlib1.dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\zlib1.dll: $(CFG)\$(PLAT)\zlib $(zlib_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(zlib_OBJS) -base:0x5A4C0000
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
	@-del /f /q $(CFG)\$(PLAT)\zlib-tests\*.obj
	@-del /f /q $(CFG)\$(PLAT)\zlib\*.obj
	@-del /f /q vc$(VSVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
