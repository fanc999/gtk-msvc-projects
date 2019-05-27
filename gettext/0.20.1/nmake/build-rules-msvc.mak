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

{..\gettext-runtime\libasprintf\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\asprintf\}.obj::
	$(CC) $(ASPRINTF_INCLUDES) $(ASPRINTF_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\asprintf\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\asprintf\ /c @<<
$<
<<

{..\gettext-runtime\libasprintf\}.cc{vs$(VSVER)\$(CFG)\$(PLAT)\asprintf\}.obj::
	$(CC) $(CXXFLAGS) $(ASPRINTF_INCLUDES) $(ASPRINTF_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\asprintf\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\asprintf\ /c @<<
$<
<<

{..\gettext-runtime\intl\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\intl-runtime\}.obj::
	$(CC) $(GETTEXT_RUNTIME_INCLUDES) $(GETTEXT_RUNTIME_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\intl-runtime\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\intl-runtime\ /c @<<
$<
<<

{..\gettext-runtime\gnulib-lib\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\grt\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\grt\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\grt
	$(CC) $(GETTEXT_RUNTIME_GNULIB_INCLUDES) $(GETTEXT_RUNTIME_GNULIB_CFLAGS) $(EXTRA_INSTALL_PATHS_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\grt\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\grt\ /c @<<
$<
<<

{..\gettext-runtime\gnulib-lib\glthread\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\grt\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\grt\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\grt
	$(CC) $(GETTEXT_RUNTIME_GNULIB_INCLUDES) $(GETTEXT_RUNTIME_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\grt\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\grt\ /c @<<
$<
<<

{..\gettext-runtime\gnulib-lib\unistr\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\grt\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\grt\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\grt
	$(CC) $(GETTEXT_RUNTIME_GNULIB_INCLUDES) $(GETTEXT_RUNTIME_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\grt\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\grt\ /c @<<
$<
<<

{..\gettext-runtime\gnulib-lib\uniwidth\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\grt\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\grt\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\grt
	$(CC) $(GETTEXT_RUNTIME_GNULIB_INCLUDES) $(GETTEXT_RUNTIME_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\grt\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\grt\ /c @<<
$<
<<

{..\gettext-runtime\src\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools
	$(CC) $(GETTEXT_RUNTIME_GNULIB_INCLUDES) $(GETTEXT_RUNTIME_GNULIB_CFLAGS) $(EXTRA_INSTALL_PATHS_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\ /c @<<
$<
<<

## libtextstyle
{..\libtextstyle\lib\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\}.obj::
	$(CC) $(LIBTEXTSTYLE_INCLUDES) $(LIBTEXTSTYLE_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\ /c @<<
$<
<<

{..\libtextstyle\lib\libcroco\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\}.obj::
	$(CC) $(LIBTEXTSTYLE_INCLUDES) $(LIBTEXTSTYLE_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\ /c @<<
$<
<<

{..\libtextstyle\lib\glib\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\}.obj::
	$(CC) $(LIBTEXTSTYLE_INCLUDES) $(LIBTEXTSTYLE_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\ /c @<<
$<
<<

{..\libtextstyle\lib\libxml\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\libxml\}.obj::
	$(CC) $(LIBTEXTSTYLE_INCLUDES) $(LIBTEXTSTYLE_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\libxml\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\libxml\ /c @<<
$<
<<

{..\libtextstyle\lib\unistr\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\}.obj::
	$(CC) $(LIBTEXTSTYLE_INCLUDES) $(LIBTEXTSTYLE_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\ /c @<<
$<
<<

## gettext-tools
{..\gettext-tools\gnulib-lib\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\}.obj::
	$(CC) $(GETTEXT_TOOLS_INCLUDES) $(GETTEXT_TOOLS_GNULIB_CFLAGS) $(EXTRA_INSTALL_PATHS_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /c @<<
$<
<<

{..\gettext-tools\gnulib-lib\glthread\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\}.obj::
	$(CC) $(GETTEXT_TOOLS_INCLUDES) $(GETTEXT_TOOLS_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /c @<<
$<
<<

{..\gettext-tools\gnulib-lib\uniconv\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\}.obj::
	$(CC) $(GETTEXT_TOOLS_INCLUDES) $(GETTEXT_TOOLS_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /c @<<
$<
<<

{..\gettext-tools\gnulib-lib\unictype\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\}.obj::
	$(CC) $(GETTEXT_TOOLS_INCLUDES) $(GETTEXT_TOOLS_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /c @<<
$<
<<

{..\gettext-tools\gnulib-lib\unilbrk\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\}.obj::
	$(CC) $(GETTEXT_TOOLS_INCLUDES) $(GETTEXT_TOOLS_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /c @<<
$<
<<

{..\gettext-tools\gnulib-lib\uniname\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\}.obj::
	$(CC) $(GETTEXT_TOOLS_INCLUDES) $(GETTEXT_TOOLS_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /c @<<
$<
<<

{..\gettext-tools\gnulib-lib\unistr\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\}.obj::
	$(CC) $(GETTEXT_TOOLS_INCLUDES) $(GETTEXT_TOOLS_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /c @<<
$<
<<

{..\gettext-tools\gnulib-lib\uniwidth\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\}.obj::
	$(CC) $(GETTEXT_TOOLS_INCLUDES) $(GETTEXT_TOOLS_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\ /c @<<
$<
<<

{..\gettext-tools\gnulib-lib\libxml\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\libxml\}.obj::
	$(CC) $(GETTEXT_TOOLS_INCLUDES) $(GETTEXT_TOOLS_GNULIB_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\libxml\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\libxml\ /c @<<
$<
<<

{..\gettext-tools\libgrep\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libgrep\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\libgrep\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\libgrep
	$(CC) $(LIBGREP_INCLUDES) $(LIBGREP_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libgrep\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libgrep\ /c @<<
$<
<<

{..\gettext-tools\libgrep\glthread\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\libgrep\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\libgrep\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\libgrep
	$(CC) $(LIBGREP_INCLUDES) $(LIBGREP_CFLAGS) /Fovs$(VSVER)\$(CFG)\$(PLAT)\libgrep\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\libgrep\ /c @<<
$<
<<

{..\gettext-tools\libgettextpo\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gnu\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\gnu\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\gnu
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /c @<<
$<
<<

{..\gettext-tools\libgettextpo\glthread\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gnu\}.obj::
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /c @<<
$<
<<

{..\gettext-tools\libgettextpo\uniconv\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gnu\}.obj::
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /c @<<
$<
<<

{..\gettext-tools\libgettextpo\unictype\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gnu\}.obj::
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /c @<<
$<
<<

{..\gettext-tools\libgettextpo\unilbrk\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gnu\}.obj::
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /c @<<
$<
<<

{..\gettext-tools\libgettextpo\unistr\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gnu\}.obj::
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /c @<<
$<
<<

{..\gettext-tools\libgettextpo\uniwidth\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gnu\}.obj::
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gnu\ /c @<<
$<
<<

{..\gettext-tools\libgettextpo\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\gnu
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\ /c @<<
$<
<<

{..\gettext-tools\src\}.c{vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\ $(MAKE) /f Makefile.vc CFG=$(CFG) vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\ /c @<<
$<
<<

# Use ..\woe32dll\c++format.cc
vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\format.obj: ..\gettext-tools\woe32dll\c++format.cc
	@if not exist $(@D) $(MAKE) /f Makefile.vc CFG=$(CFG) $(@D)
	$(CC) $(GETTEXTPO_GNULIB_INCLUDES) $(LIBGETTEXTPO_DEFINES) /Fo$@ /Fd$(@D)\ /c @<<
$**
<<

# Rules for building .rc files
vs$(VSVER)\$(CFG)\$(PLAT)\asprintf\libasprintf.res: ..\gettext-runtime\libasprintf\libasprintf.rc
vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\gettext.res: ..\windows\gettext.rc
vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\libgettextpo.res: ..\gettext-tools\libgettextpo\libgettextpo.rc
vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\libtextstyle.res: ..\libtextstyle\lib\libtextstyle.rc
vs$(VSVER)\$(CFG)\$(PLAT)\intl-runtime\libintl.res: ..\gettext-runtime\intl\libintl.rc

vs$(VSVER)\$(CFG)\$(PLAT)\asprintf\libasprintf.res	\
vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\gettext.res	\
vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\libgettextpo.res	\
vs$(VSVER)\$(CFG)\$(PLAT)\intl-runtime\libintl.res	\
vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\libtextstyle.res:
	@if not exist $(@D) $(MAKE) /f Makefile.vc CFG=$(CFG) $(@D)
	$(RC) $(GETTEXT_RC_FLAGS) /fo$@ $**

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]

# Rules for building .lib files
$(INTL_LIB): vs$(VSVER)\$(CFG)\$(PLAT)\intl.dll
$(ASPRINTF_LIB): vs$(VSVER)\$(CFG)\$(PLAT)\asprintf.dll
$(GETTEXTLIB_LIB):  vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib-$(GETTEXT_VERSION).dll
$(GETTEXTPO_LIB):  vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo.dll
$(LIBTEXTSTYLE_LIB): vs$(VSVER)\$(CFG)\$(PLAT)\textstyle.dll

$(GRT_LIB): $(grt_OBJS)
$(LIBGREP_LIB): $(libgrep_OBJS)

$(GRT_LIB) $(LIBGREP_LIB):
	lib $(ARFLAGS) $** /out:$@

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
vs$(VSVER)\$(CFG)\$(PLAT)\asprintf.dll: vs$(VSVER)\$(CFG)\$(PLAT)\asprintf $(libasprintf_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(libasprintf_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

vs$(VSVER)\$(CFG)\$(PLAT)\GNU.Gettext.dll: ..\gettext-runtime\intl-csharp\intl.cs vs$(VSVER)\$(CFG)\$(PLAT)\intl.dll
	csc $(CSCFLAGS) /target:library /out:$@ ..\gettext-runtime\intl-csharp\intl.cs

vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib-$(GETTEXT_VERSION).dll: ..\gettext-tools\gnulib-lib\msvc\libgettextlib.def vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\libxml $(gettextlib_OBJS) $(INTL_LIB)
	link /DLL $(LDFLAGS) -out:$@ $(gettextlib_OBJS) $(INTL_LIB) $(GETTEXT_RUNTIME_DEP_LIBS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo.dll: vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo $(gettextpo_OBJS) $(gettextpo_gnulib_OBJS) $(INTL_LIB)
	link /DLL $(LDFLAGS) -out:$@ $(gettextpo_OBJS) $(gettextpo_gnulib_OBJS) $(INTL_LIB) $(GETTEXT_RUNTIME_DEP_LIBS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

vs$(VSVER)\$(CFG)\$(PLAT)\intl.dll: vs$(VSVER)\$(CFG)\$(PLAT)\intl-runtime $(intl_runtime_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(intl_runtime_OBJS) $(GETTEXT_RUNTIME_DEP_LIBS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

vs$(VSVER)\$(CFG)\$(PLAT)\textstyle.dll: vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\libxml $(libtextstyle_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(libtextstyle_OBJS) $(GETTEXT_RUNTIME_DEP_LIBS) /def:..\libtextstyle\lib\msvc\libtextstyle.def
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1
vs$(VSVER)\$(CFG)\$(PLAT)\envsubst.exe: $(INTL_LIB) $(GRT_LIB) vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\envsubst.obj vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\gettext.res
vs$(VSVER)\$(CFG)\$(PLAT)\gettext.exe: $(INTL_LIB) $(GRT_LIB) vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\gettext.obj vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\gettext.res
vs$(VSVER)\$(CFG)\$(PLAT)\ngettext.exe: $(INTL_LIB) $(GRT_LIB) vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\ngettext.obj vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\gettext.res

vs$(VSVER)\$(CFG)\$(PLAT)\envsubst.exe	\
vs$(VSVER)\$(CFG)\$(PLAT)\gettext.exe	\
vs$(VSVER)\$(CFG)\$(PLAT)\ngettext.exe:
	link $(LDFLAGS) $(INTL_LIB) $(GRT_LIB) $(GETTEXT_RUNTIME_DEP_LIBS) -out:$@ vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\$(@B).obj vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\gettext.res /implib:$(@D)\unwanted.lib
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
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\asprintf\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\asprintf\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\libxml\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib\libxml\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gettext-runtime-tools\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gnu\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\gnu\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\grt\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\grt\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\intl-runtime\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\intl-runtime\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libgrep\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libgrep\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\libxml\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\libxml\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\*.obj
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\libtextstyle\*.pdb
	@-rmdir /s /q vs$(VSVER)\$(CFG)\$(PLAT)
