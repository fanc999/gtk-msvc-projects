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
{..\source\stubdata\}.cpp{$(CFG)\$(PLAT)\stubdata\}.obj::
	$(CC) $(CXXFLAGS) $(ICU_BASE_INCLUDES) $(ICU_STUB_DATA_CFLAGS) /Fo$(CFG)\$(PLAT)\stubdata\ /c @<<
$<
<<

{..\source\common\}.c{$(CFG)\$(PLAT)\common\}.obj::
	$(CC) $(CFLAGS) $(ICU_BASE_INCLUDES) $(ICU_UC_CFLAGS) /Fo$(CFG)\$(PLAT)\common\ /c @<<
$<
<<

{..\source\common\}.cpp{$(CFG)\$(PLAT)\common\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_BASE_INCLUDES) $(ICU_UC_CFLAGS) /Fo$(CFG)\$(PLAT)\common\ /c @<<
$<
<<

{..\source\i18n\}.c{$(CFG)\$(PLAT)\i18n\}.obj::
	$(CC) $(CFLAGS) $(ICU_IN_INCLUDES) $(ICU_IN_CFLAGS) /Fo$(CFG)\$(PLAT)\i18n\ /c @<<
$<
<<

{..\source\i18n\}.cpp{$(CFG)\$(PLAT)\i18n\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_IN_INCLUDES) $(ICU_IN_CFLAGS) /Fo$(CFG)\$(PLAT)\i18n\ /c @<<
$<
<<

{..\source\io\}.c{$(CFG)\$(PLAT)\io\}.obj::
	$(CC) $(CFLAGS) $(ICU_IO_INCLUDES) $(ICU_IO_CFLAGS) /Fo$(CFG)\$(PLAT)\io\ /c @<<
$<
<<

{..\source\io\}.cpp{$(CFG)\$(PLAT)\io\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_IO_INCLUDES) $(ICU_IO_CFLAGS) /Fo$(CFG)\$(PLAT)\io\ /c @<<
$<
<<

{..\source\tools\toolutil\}.c{$(CFG)\$(PLAT)\icutu\}.obj::
	$(CC) $(CFLAGS) $(ICU_TU_INCLUDES) $(ICU_TU_CFLAGS) /Fo$(CFG)\$(PLAT)\icutu\ /c @<<
$<
<<

{..\source\tools\toolutil\}.cpp{$(CFG)\$(PLAT)\icutu\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TU_INCLUDES) $(ICU_TU_CFLAGS) /Fo$(CFG)\$(PLAT)\icutu\ /c @<<
$<
<<

{..\source\tools\ctestfw\}.c{$(CFG)\$(PLAT)\icutest\}.obj::
	$(CC) $(CFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_TEST_CFLAGS) /Fo$(CFG)\$(PLAT)\icutest\ /c @<<
$<
<<

{..\source\tools\ctestfw\}.cpp{$(CFG)\$(PLAT)\icutest\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_TEST_CFLAGS) /Fo$(CFG)\$(PLAT)\icutest\ /c @<<
$<
<<


{..\source\tools\genbrk\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\gencfu\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\genccode\}.c{$(CFG)\$(PLAT)\tools\}.obj::
	$(CC) $(CFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\gencmn\}.c{$(CFG)\$(PLAT)\tools\}.obj::
	$(CC) $(CFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\gencnval\}.c{$(CFG)\$(PLAT)\tools\}.obj::
	$(CC) $(CFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\gendict\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\gennorm2\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\genrb\}.c{$(CFG)\$(PLAT)\tools\}.obj::
	$(CC) $(CFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\genrb\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\gensprep\}.c{$(CFG)\$(PLAT)\tools\}.obj::
	$(CC) $(CFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\gentest\}.c{$(CFG)\$(PLAT)\tools\}.obj::
	$(CC) $(CFLAGS) $(ICU_TEST_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\icuinfo\}.c{$(CFG)\$(PLAT)\testplug\}.obj::
	$(CC) $(CFLAGS) $(ICU_TEST_INCLUDES) $(ICU_TEST_CFLAGS) /Fo$(CFG)\$(PLAT)\testplug\ /c @<<
$<
<<

{..\source\tools\icuinfo\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\icupkg\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\makeconv\}.c{$(CFG)\$(PLAT)\tools\}.obj::
	$(CC) $(CFLAGS) $(ICU_TEST_INCLUDES) $(ICU_TEST_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\makeconv\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\pkgdata\}.c{$(CFG)\$(PLAT)\tools\}.obj::
	$(CC) $(CFLAGS) $(ICU_TEST_INCLUDES) $(ICU_TEST_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\tools\pkgdata\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\extra\uconv\}.c{$(CFG)\$(PLAT)\tools\}.obj::
	$(CC) $(CFLAGS) $(ICU_TEST_INCLUDES) $(UCONV_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\extra\uconv\}.cpp{$(CFG)\$(PLAT)\tools\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TOOL_INCLUDES) $(UCONV_CFLAGS) /Fo$(CFG)\$(PLAT)\tools\ /c @<<
$<
<<

{..\source\samples\cal\}.c{$(CFG)\$(PLAT)\samples_cal\}.obj::
	$(CC) $(CFLAGS) $(ICU_IN_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\samples_cal\ /c @<<
$<
<<

{..\source\samples\date\}.c{$(CFG)\$(PLAT)\samples_date\}.obj::
	$(CC) $(CFLAGS) $(ICU_IN_INCLUDES) $(ICU_BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\samples_date\ /c @<<
$<
<<

{..\source\test\iotest\}.c{$(CFG)\$(PLAT)\iotest\}.obj::
	$(CC) $(CFLAGS) $(ICU_TEST_INCLUDES) $(ICU_DEPRECATION_CFLAG) /Fo$(CFG)\$(PLAT)\iotest\ /c @<<
$<
<<

{..\source\test\iotest\}.cpp{$(CFG)\$(PLAT)\iotest\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TEST_INCLUDES) $(ICU_DEPRECATION_CFLAG) /Fo$(CFG)\$(PLAT)\iotest\ /c @<<
$<
<<

{..\source\test\intltest\}.c{$(CFG)\$(PLAT)\intltest\}.obj::
	$(CC) $(CFLAGS) $(ICU_TEST_INCLUDES) $(ICU_DEPRECATION_CFLAG) /Fo$(CFG)\$(PLAT)\intltest\ /c @<<
$<
<<

{..\source\test\intltest\}.cpp{$(CFG)\$(PLAT)\intltest\}.obj::
	$(CXX) $(CXXFLAGS) $(ICU_TEST_INCLUDES) $(ICU_DEPRECATION_CFLAG) /Fo$(CFG)\$(PLAT)\intltest\ /c @<<
$<
<<

{..\source\test\cintltst\}.c{$(CFG)\$(PLAT)\cintltst\}.obj::
	$(CC) $(CFLAGS) $(ICU_TEST_INCLUDES) $(ICU_DEPRECATION_CFLAG) /Fo$(CFG)\$(PLAT)\cintltst\ /c @<<
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
$(CFG)\$(PLAT)\icudt.lib: $(CFG)\$(PLAT)\icudt$(ICU_VER).dll
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib: $(CFG)\$(PLAT)\icuuc$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib: $(CFG)\$(PLAT)\icuin$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll
$(CFG)\$(PLAT)\icuio$(ICU_DEBUG_SUFFIX).lib: $(CFG)\$(PLAT)\icuio$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib: $(CFG)\$(PLAT)\icutu$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll
$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib: $(CFG)\$(PLAT)\icutest$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll
$(CFG)\$(PLAT)\testplug$(ICU_DEBUG_SUFFIX).lib: $(CFG)\$(PLAT)\testplug$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\icudt$(ICU_VER).dll: $(CFG)\$(PLAT)\stubdata ..\source\stubdata\stubdatabuilt.txt $(ICU_STUB_DATA_OBJS)
	link /DLL $(LDFLAGS) -out:$@ /implib:$(CFG)\$(PLAT)\icudt.lib @<<
$(ICU_STUB_DATA_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\icuuc$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll: ..\source\stubdata\stubdatabuilt.txt $(CFG)\$(PLAT)\common $(ICU_UC_OBJS)
	link /DLL $(LDFLAGS) $(CFG)\$(PLAT)\icudt.lib $(ICU_SYSTEM_LIBS) -out:$@ /implib:$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib @<<
$(ICU_UC_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\icuin$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll: $(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib $(CFG)\$(PLAT)\i18n $(ICU_IN_OBJS)
	link /DLL $(LDFLAGS) $(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib $(ICU_SYSTEM_LIBS) -out:$@ /implib:$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib @<<
$(ICU_IN_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\icuio$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll: $(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib $(CFG)\$(PLAT)\io $(ICU_IO_OBJS)
	link /DLL $(LDFLAGS) $(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib $(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib $(ICU_SYSTEM_LIBS) -out:$@ /implib:$(CFG)\$(PLAT)\icuio$(ICU_DEBUG_SUFFIX).lib @<<
$(ICU_IO_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\icutu$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll: $(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib $(CFG)\$(PLAT)\icutu $(ICU_TU_OBJS)
	link /DLL $(LDFLAGS) $(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib $(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib $(ICU_SYSTEM_LIBS) -out:$@ /implib:$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib @<<
$(ICU_TU_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\icutest$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll: $(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib $(CFG)\$(PLAT)\icutest $(ICU_TEST_OBJS)
	link /DLL $(LDFLAGS) $(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib $(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib $(ICU_SYSTEM_LIBS) -out:$@ /implib:$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib @<<
$(ICU_TEST_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\testplug$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll: $(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib $(CFG)\$(PLAT)\testplug $(ICU_TESTPLUG_OBJS)
	link /DLL $(LDFLAGS) $(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib $(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib $(ICU_SYSTEM_LIBS) -out:$@ /implib:$(CFG)\$(PLAT)\testplug$(ICU_DEBUG_SUFFIX).lib @<<
$(ICU_TESTPLUG_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\derb.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuio$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(DERB_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuio$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(DERB_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\genbrk.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(GENBRK_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(GENBRK_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\genccode.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(GENCCODE_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(GENCCODE_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\gencfu.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(GENCFU_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(GENCFU_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\gencnval.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(GENCNVAL_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(GENCNVAL_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\gencmn.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(GENCMN_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(GENCMN_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\gendict.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(GENDICT_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(GENDICT_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\gennorm2.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(GENNORM2_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(GENNORM2_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\genrb.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(GENRB_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(GENRB_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\gensprep.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(GENSPREP_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(GENSPREP_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\gentest.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib	\
$(GENTEST_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib @<<
$(GENTEST_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\icuinfo.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib	\
$(ICUINFO_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib @<<
$(ICUINFO_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\icupkg.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(ICUPKG_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib @<<
$(ICUPKG_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\makeconv.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(MAKECONV_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib @<<
$(MAKECONV_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\pkgdata.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(PKGDATA_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	@<<
$(PKGDATA_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\uconv.exe:	\
$(CFG)\$(PLAT)\tools		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\uconvmsg.lib	\
$(UCONV_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\uconvmsg.lib @<<
$(UCONV_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\icu-sample-cal.exe:	\
$(CFG)\$(PLAT)\samples_cal		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(CAL_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	@<<
$(CAL_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\icu-sample-date.exe:	\
$(CFG)\$(PLAT)\samples_date		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(DATE_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	@<<
$(DATE_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\iotest.exe:	\
$(CFG)\$(PLAT)\iotest		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuio$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib	\
$(IOTEST_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuio$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib @<<
$(IOTEST_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\intltest.exe:	\
$(CFG)\$(PLAT)\intltest		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib	\
$(INTLTEST_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib @<<
$(INTLTEST_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\cintltst.exe:	\
$(CFG)\$(PLAT)\cintltst		\
$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib	\
$(CINTLTST_OBJS)
	link $(LDFLAGS) -out:$@	\
	$(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib	\
	$(CFG)\$(PLAT)\icutest$(ICU_DEBUG_SUFFIX).lib @<<
$(CINTLTST_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Other .obj files requiring individual attention, that could not be covered by the inference rules.
# Format is as follows (all dirs must have a trailing '\'):
#
# $(obj_file):
# 	$(CC)|$(CXX) $(cflags) /Fo$(obj_destdir) /c @<<
# $(srcfile)
# <<

$(CFG)\$(PLAT)\stubdata\icudt.res: ..\source\data\misc\icudata.rc $(CFG)\$(PLAT)\stubdata
	$(RC) $(ICU_BASE_INCLUDES) /fo$@ ..\source\data\misc\icudata.rc

$(CFG)\$(PLAT)\common\icuuc.res: ..\source\common\common.rc $(CFG)\$(PLAT)\common
	$(RC) $(ICU_BASE_INCLUDES) /fo$@ ..\source\common\common.rc

$(CFG)\$(PLAT)\i18n\icuin.res: ..\source\i18n\i18n.rc $(CFG)\$(PLAT)\i18n
	$(RC) $(ICU_BASE_INCLUDES) /fo$@ ..\source\i18n\i18n.rc

$(CFG)\$(PLAT)\io\icuio.res: ..\source\io\io.rc $(CFG)\$(PLAT)\io
	$(RC) $(ICU_BASE_INCLUDES) /fo$@ ..\source\io\io.rc

clean:
	$(MAKE) /f ..\source\data\makedata.mak ICUMAKE=%CD%\..\source\data\ PROJECTDIR=%CD% CFG=$(CFG) PLAT=$(PLAT) clean
	@-del /f /q $(CFG)\$(PLAT)\*.pdb
	@-for %a in ($(CFG)\$(PLAT)\*.exe.manifest) do @del /f /q %a
	@-del /f /q $(CFG)\$(PLAT)\*.exe
	@-for %a in ($(CFG)\$(PLAT)\*.dll.manifest) do @del /f /q %a
	@-del /f /q $(CFG)\$(PLAT)\*.dll
	@-for %a in ($(CFG)\$(PLAT)\*.ilk) do @del /f /q %a
	@-del /f /q $(CFG)\$(PLAT)\stubdata\*.obj
	@-del /f /q $(CFG)\$(PLAT)\common\*.obj
	@-del /f /q $(CFG)\$(PLAT)\i18n\*.obj
	@-del /f /q $(CFG)\$(PLAT)\io\*.obj
	@-del /f /q $(CFG)\$(PLAT)\icutu\*.obj
	@-del /f /q $(CFG)\$(PLAT)\icutest\*.obj
	@-del /f /q $(CFG)\$(PLAT)\testplug\*.obj
	@-del /f /q $(CFG)\$(PLAT)\tools\*.obj
	@-del /f /q $(CFG)\$(PLAT)\uconvmsg.lib
	@-del /f /q $(CFG)\$(PLAT)\uconvmsg_dat.obj
	@-del /f /q $(CFG)\$(PLAT)\uconvmsg.dat
	@-del /f /q ..\source\extra\uconv\resources\root.res
	@-del /f /q ..\source\extra\uconv\resources\fr.res
	@-del /f /q ..\source\stubdata\stubdatabuilt.txt
	@-rmdir /s /q $(CFG)\$(PLAT)
	@-del vc$(VSVER)0.pdb
