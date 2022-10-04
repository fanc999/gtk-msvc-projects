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
{..\src\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libffi\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\libffi\ mkdir vs$(VSVER)\$(CFG)\$(PLAT)\libffi
	$(CC) $(LIBFFI_CFLAGS) $(LIBFFI_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libffi\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libffi\ /c @<<
$<
<<

{$(ARCH_SRCDIR)\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libffi\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\libffi\ mkdir vs$(VSVER)\$(CFG)\$(PLAT)\libffi
	$(CC) $(LIBFFI_CFLAGS) $(LIBFFI_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libffi\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libffi\ /c @<<
$<
<<

vs$(VSVER)\$(CFG)\$(PLAT)\libffi\plat_asm.asm: $(PLAT_ASM_SRC)
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\libffi\ mkdir vs$(VSVER)\$(CFG)\$(PLAT)\libffi
	$(CPP) /EP $(LIBFFI_CFLAGS) $(LIBFFI_INCLUDES) $**>$@

vs$(VSVER)\$(CFG)\$(PLAT)\libffi\plat_asm.obj: vs$(VSVER)\$(CFG)\$(PLAT)\libffi\plat_asm.asm
	$(MASM) $(MASM_ARGS) $@ $** $(MASM_EXTRA_ARGS)

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(LIBFFI_LIB): $(LIBFFI_DLL)
$(LIBFFI_DLL): $(libffi_OBJS)
	link /DLL $(LDFLAGS) /implib:$(LIBFFI_LIB) -out:$@ @<<
$**
<<

	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

clean:
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.dll.manifest
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.dll
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.ilk
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.exp
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.lib
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libffi\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libffi\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libffi\*.asm
	@-rd vs$(VSVER)\$(CFG)\$(PLAT)\libffi