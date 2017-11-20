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

{..\libcharset\lib\}.c{$(CFG)\$(PLAT)\libcharset\}.obj::
	$(CC) $(LIBCHARSET_INCLUDES) $(LIBCHARSET_CFLAGS) /Fo$(CFG)\$(PLAT)\libcharset\ /c @<<
$<
<<

{..\lib\}.c{$(CFG)\$(PLAT)\libiconv\}.obj::
	$(CC) $(LIBICONV_INCLUDES) $(LIBICONV_CFLAGS) /Fo$(CFG)\$(PLAT)\libiconv\ /c @<<
$<
<<

{..\srclib\}.c{$(CFG)\$(PLAT)\iconv-gnulib\}.obj::
	$(CC) $(ICONV_INCLUDES) $(ICONV_CFLAGS) /Fo$(CFG)\$(PLAT)\iconv-gnulib\ /c @<<
$<
<<

{..\srclib\uniwidth\}.c{$(CFG)\$(PLAT)\iconv-gnulib\}.obj::
	$(CC) $(ICONV_INCLUDES) $(ICONV_CFLAGS) /Fo$(CFG)\$(PLAT)\iconv-gnulib\ /c @<<
$<
<<

{..\src\}.c{$(CFG)\$(PLAT)\iconv\}.obj::
	$(CC) $(ICONV_INCLUDES) $(ICONV_CFLAGS) /Fo$(CFG)\$(PLAT)\iconv\ /c @<<
$<
<<

# Rules for building .rc files
$(CFG)\$(PLAT)\libcharset\libcharset.res	\
$(CFG)\$(PLAT)\libiconv\libiconv.res: ..\windows\libiconv.rc
	$(RC) $(LIBICONV_RC_FLAGS) /fo$@ $**

$(CFG)\$(PLAT)\iconv\iconv.res: ..\windows\iconv.rc
	$(RC) $(LIBICONV_RC_FLAGS) /fo$@ $**

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]

# Rules for building .lib files
$(CHARSET_LIB): $(CFG)\$(PLAT)\charset.dll
$(ICONV_LIB): $(CFG)\$(PLAT)\iconv.dll

$(ICONV_GNULIB_LIB): $(CFG)\$(PLAT)\iconv-gnulib $(iconv_gnulib_OBJS)
	lib $(ARFLAGS) $(iconv_gnulib_OBJS) /out:$@

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\charset.dll: $(CFG)\$(PLAT)\libcharset $(charset_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(charset_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\iconv.dll: $(CHARSET_LIB) $(CFG)\$(PLAT)\libiconv $(libiconv_OBJS)
	link /DLL $(LDFLAGS) $(CHARSET_LIB) /pdb:$(@R)_lib.pdb -out:$@ $(libiconv_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1
$(CFG)\$(PLAT)\iconv.exe: $(ICONV_LIB) $(ICONV_GNULIB_LIB) $(CFG)\$(PLAT)\iconv $(iconv_OBJS)
	link $(LDFLAGS) $(ICONV_LIB) $(ICONV_GNULIB_LIB) $(ICONV_DEP_LIBS) -out:$@ $(iconv_OBJS) /implib:$(@D)\unwanted.lib
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

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
	@-del /f /q $(CFG)\$(PLAT)\iconv\*.obj
	@-del /f /q $(CFG)\$(PLAT)\iconv-gnulib\*.obj
	@-del /f /q $(CFG)\$(PLAT)\libiconv\*.obj
	@-del /f /q $(CFG)\$(PLAT)\libcharset\*.obj
	@-del /f /q vc$(VSVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
