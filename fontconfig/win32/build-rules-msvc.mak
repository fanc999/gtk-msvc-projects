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
{.\compat\}.c{$(CFG)\$(PLAT)\buildtools\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\buildtools\ /c @<<
$<
<<

{..\fc-case\}.c{$(CFG)\$(PLAT)\buildtools\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\buildtools\ /c @<<
$<
<<

{..\fc-glyphname\}.c{$(CFG)\$(PLAT)\buildtools\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\buildtools\ /c @<<
$<
<<

{..\fc-lang\}.c{$(CFG)\$(PLAT)\buildtools\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\buildtools\ /c @<<
$<
<<

{..\fc-cache\}.c{$(CFG)\$(PLAT)\util\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\util\ /c @<<
$<
<<

{..\fc-cat\}.c{$(CFG)\$(PLAT)\util\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\util\ /c @<<
$<
<<

{..\fc-list\}.c{$(CFG)\$(PLAT)\util\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\util\ /c @<<
$<
<<

{..\fc-match\}.c{$(CFG)\$(PLAT)\util\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\util\ /c @<<
$<
<<

{..\fc-pattern\}.c{$(CFG)\$(PLAT)\util\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\util\ /c @<<
$<
<<

{..\fc-query\}.c{$(CFG)\$(PLAT)\util\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\util\ /c @<<
$<
<<

{..\fc-scan\}.c{$(CFG)\$(PLAT)\util\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\util\ /c @<<
$<
<<

{..\fc-validate\}.c{$(CFG)\$(PLAT)\util\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) /Fo$(CFG)\$(PLAT)\util\ /c @<<
$<
<<

{..\src\}.c{$(CFG)\$(PLAT)\fontconfig\}.obj::
	$(CC) $(CFLAGS) $(FC_INCLUDES) $(FC_BASE_DEFINES) $(FC_DLL_DEFINES) /Fo$(CFG)\$(PLAT)\fontconfig\ /c @<<
$<
<<

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]

# Rules for building .lib files
$(CFG)\$(PLAT)\fontconfig.lib: $(CFG)\$(PLAT)\fontconfig.dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\fontconfig.dll: $(FC_GENERATED_SRCS) $(FC_DLL_OBJS) $(FC_DIRENT_OBJS) $(SNPRINTF_OBJ)
	link /DLL $(LDFLAGS) $(FC_DEP_LIBS) -out:$@ @<<
$(FC_DLL_OBJS) $(FC_DIRENT_OBJS) $(SNPRINTF_OBJ)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-case.exe: config.h $(CFG)\$(PLAT)\buildtools $(FC_CASE_OBJS)
	link $(LDFLAGS) -out:$@ @<<
$(FC_CASE_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-glyphname.exe: config.h $(CFG)\$(PLAT)\buildtools $(FC_GLYPHNAME_OBJS)
	link $(LDFLAGS) -out:$@ @<<
$(FC_GLYPHNAME_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-lang.exe: config.h  $(CFG)\$(PLAT)\buildtools $(FC_LANG_OBJS)
	link $(LDFLAGS) -out:$@ @<<
$(FC_LANG_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-cache.exe: $(CFG)\$(PLAT)\fontconfig.lib $(CFG)\$(PLAT)\util $(FC_CACHE_OBJS)
	link $(LDFLAGS) $(CFG)\$(PLAT)\fontconfig.lib -out:$@ @<<
$(FC_CACHE_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-cat.exe: $(CFG)\$(PLAT)\fontconfig.lib $(CFG)\$(PLAT)\util $(FC_CAT_OBJS)
	link $(LDFLAGS) $(CFG)\$(PLAT)\fontconfig.lib -out:$@ @<<
$(FC_CAT_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-list.exe: $(CFG)\$(PLAT)\fontconfig.lib $(CFG)\$(PLAT)\util $(FC_LIST_OBJS)
	link $(LDFLAGS) $(CFG)\$(PLAT)\fontconfig.lib -out:$@ @<<
$(FC_LIST_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-match.exe: $(CFG)\$(PLAT)\fontconfig.lib $(CFG)\$(PLAT)\util $(FC_MATCH_OBJS)
	link $(LDFLAGS) $(CFG)\$(PLAT)\fontconfig.lib -out:$@ @<<
$(FC_MATCH_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-pattern.exe: $(CFG)\$(PLAT)\fontconfig.lib $(CFG)\$(PLAT)\util $(FC_PATTERN_OBJS)
	link $(LDFLAGS) $(CFG)\$(PLAT)\fontconfig.lib -out:$@ @<<
$(FC_PATTERN_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-query.exe: $(CFG)\$(PLAT)\fontconfig.lib $(CFG)\$(PLAT)\util $(FC_QUERY_OBJS)
	link $(LDFLAGS) $(CFG)\$(PLAT)\fontconfig.lib -out:$@ @<<
$(FC_QUERY_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-scan.exe: $(CFG)\$(PLAT)\fontconfig.lib $(CFG)\$(PLAT)\util $(FC_SCAN_OBJS)
	link $(LDFLAGS) $(CFG)\$(PLAT)\fontconfig.lib -out:$@ @<<
$(FC_SCAN_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\fc-validate.exe: $(CFG)\$(PLAT)\fontconfig.lib $(CFG)\$(PLAT)\util $(FC_VALIDATE_OBJS)
	link $(LDFLAGS) $(CFG)\$(PLAT)\fontconfig.lib $(FREETYPE_LIB) -out:$@ @<<
$(FC_VALIDATE_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Other .obj files requiring individual attention, that could not be covered by the inference rules.
# Format is as follows (all dirs must have a trailing '\'):
#
# $(obj_file):
# 	$(CC)|$(CXX) $(cflags) /Fo$(obj_destdir) /c @<<
# $(srcfile)
# <<

clean:
	@-del /f /q $(CFG)\$(PLAT)\*.pdb
	@-for %a in ($(CFG)\$(PLAT)\*.exe.manifest) do @del /f /q %a
	@-del /f /q $(CFG)\$(PLAT)\*.exe
	@-for %a in ($(CFG)\$(PLAT)\*.dll.manifest) do @del /f /q %a
	@-del /f /q $(CFG)\$(PLAT)\*.dll
	@-for %a in ($(CFG)\$(PLAT)\*.ilk) do @del /f /q %a
	@-del /f /q $(CFG)\$(PLAT)\fontconfig\*.h
	@-del /f /q $(CFG)\$(PLAT)\fontconfig\*.obj
	@-del /f /q $(CFG)\$(PLAT)\util\*.obj
	@-rmdir /s /q $(CFG)\$(PLAT)
	@if exist __pycache__\NUL rmdir /s /q __pycache__
	@-del *.pyc
	@-del vc$(VSVER)0.pdb
	@-del config.h
