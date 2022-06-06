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

{..\libcharset\lib\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libcharset\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\libcharset\ md vs$(VSVER)\$(CFG)\$(PLAT)\libcharset
	$(CC) $(LIBCHARSET_INCLUDES) $(LIBCHARSET_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libcharset\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libcharset\ /c @<<
$<
<<

{..\lib\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libiconv\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\libiconv\ md vs$(VSVER)\$(CFG)\$(PLAT)\libiconv
	$(CC) $(LIBICONV_INCLUDES) $(LIBICONV_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libiconv\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libiconv\ /c @<<
$<
<<

{..\libcharset\lib\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libiconv\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\libiconv\ md vs$(VSVER)\$(CFG)\$(PLAT)\libiconv
	$(CC) $(LIBICONV_INCLUDES) $(LIBICONV_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libiconv\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libiconv\ /c @<<
$<
<<

{..\srclib\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\ md vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib
	$(CC) $(ICONV_INCLUDES) $(ICONV_CFLAGS) /DLIBPATHVAR=\"PATH\" /DLIBDIRS=\"c:/software.b/libiconv-1.17/bin\" /DINSTALLDIR=\"c:/software.b/libiconv-1.17/bin\" /Fovs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\ /c @<<
$<
<<

{..\srclib\malloc\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib md vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib
	$(CC) $(ICONV_INCLUDES) $(ICONV_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\ /c @<<
$<
<<

{..\srclib\uniwidth\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib md vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib
	$(CC) $(ICONV_INCLUDES) $(ICONV_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\ /c @<<
$<
<<

{..\src\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\iconv\}.obj::
	if not exist vs$(VSVER)\$(CFG)\$(PLAT)\iconv\ md vs$(VSVER)\$(CFG)\$(PLAT)\iconv
	$(CC) $(ICONV_INCLUDES) $(ICONV_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\iconv\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\iconv\ /c @<<
$<
<<

# Rules for building .rc files
vs$(VSVER)\$(CFG)\$(PLAT)\libcharset\libcharset.res: ..\windows\libiconv.rc
vs$(VSVER)\$(CFG)\$(PLAT)\libiconv\libiconv.res: ..\windows\libiconv.rc
vs$(VSVER)\$(CFG)\$(PLAT)\iconv\iconv.res: ..\windows\iconv.rc

vs$(VSVER)\$(CFG)\$(PLAT)\libcharset\libcharset.res	\
vs$(VSVER)\$(CFG)\$(PLAT)\libiconv\libiconv.res	\
vs$(VSVER)\$(CFG)\$(PLAT)\iconv\iconv.res:
	@if not exist $(@D)\ md $(@D)
	$(RC) $(LIBICONV_RC_FLAGS) /fo$@ $**

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]

# Rules for building .lib files
$(CHARSET_LIB): vs$(VSVER)\$(CFG)\$(PLAT)\charset.dll
$(ICONV_LIB): vs$(VSVER)\$(CFG)\$(PLAT)\iconv.dll

$(ICONV_GNULIB_LIB): $(iconv_gnulib_OBJS)
	lib $(ARFLAGS) $(iconv_gnulib_OBJS) /out:$@

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
vs$(VSVER)\$(CFG)\$(PLAT)\charset.dll: $(charset_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(charset_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

vs$(VSVER)\$(CFG)\$(PLAT)\iconv.dll: $(CHARSET_LIB) $(libiconv_OBJS)
	link /DLL $(LDFLAGS) $(CHARSET_LIB) -out:$@ $(libiconv_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1
vs$(VSVER)\$(CFG)\$(PLAT)\iconv.exe: $(ICONV_LIB) $(ICONV_GNULIB_LIB) $(iconv_OBJS)
	link $(LDFLAGS) $(ICONV_LIB) $(ICONV_GNULIB_LIB) $(ICONV_DEP_LIBS) -out:$@ $(iconv_OBJS) /pdb:$(@R)_exe.pdb /implib:$(@D)\unwanted.lib
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Other .obj files requiring individual attention, that could not be covered by the inference rules.
# Format is as follows (all dirs must have a trailing '\'):
#
# $(obj_file):
# 	$(CC)|$(CXX) $(cflags) /Fo$(obj_destdir) /c @<<
# $(srcfile)
# <<

clean:
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.lib
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.exe.manifest
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.exe
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.dll.manifest
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.dll
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.ilk
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\iconv\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\iconv\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libiconv\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libiconv\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libcharset\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libcharset\*.pdb
	@-rmdir /s /q vs$(VSVER)\$(CFG)\$(PLAT)
