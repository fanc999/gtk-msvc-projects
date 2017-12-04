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

$(CFG)\$(PLAT)\sqlite3-dll\sqlite3.obj: ..\sqlite3.c ..\sqlite3.h ..\sqlite3ext.h $(CFG)\$(PLAT)\sqlite3-dll
	$(CC) $(SQLITE3_INCLUDES) $(SQLITE3_LIB_CFLAGS) /Fo$(CFG)\$(PLAT)\sqlite3-dll\ ..\$(@B).c /c

$(CFG)\$(PLAT)\sqlite3\shell.obj: ..\shell.c ..\sqlite3.h ..\sqlite3ext.h $(CFG)\$(PLAT)\sqlite3
	$(CC) $(SQLITE3_INCLUDES) $(SQLITE3_USE_CFLAGS) /Fo$(CFG)\$(PLAT)\sqlite3\ ..\$(@B).c /c

$(CFG)\$(PLAT)\tcl-sqlite3\nmakehlp.obj: $(CFG)\$(PLAT)\tcl-sqlite3 ..\tea\win\nmakehlp.c
	$(CC) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\tcl-sqlite3\ ..\tea\win\$(@B).c /c

$(CFG)\$(PLAT)\tcl-sqlite3\tclsqlite3.obj: ..\tea\generic\tclsqlite3.c
	$(CC) $(SQLITE3_INCLUDES) $(SQLITE3_TCL_CFLAGS) /Fo$(CFG)\$(PLAT)\tcl-sqlite3\ $** /c

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]

# Rules for building .lib files
$(SQLITE3_LIB): $(CFG)\$(PLAT)\sqlite3.dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\sqlite3.dll: $(CFG)\$(PLAT)\sqlite3-dll\sqlite3.obj $(CFG)\$(PLAT)\sqlite3-dll\sqlite3.res
	link /DLL $(LDFLAGS) -out:$@ $(SQLITE3_DEP_LIBS) /PDB:$(@R)-dll.pdb $**
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\sqlite3$(SQLITE3_VER_NUM)t.dll: $(SQLITE3_LIB) $(CFG)\$(PLAT)\tcl-sqlite3\tclsqlite3.obj
	link /DLL $(LDFLAGS) -out:$@ $(TCL_SQLITE3_DEP_LIBS) $**
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\sqlite3.exe: $(SQLITE3_LIB) $(CFG)\$(PLAT)\sqlite3\shell.obj $(CFG)\$(PLAT)\sqlite3-dll\sqlite3.res
	link $(LDFLAGS) -out:$@ $**
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\nmakehlp.exe: $(CFG)\$(PLAT)\tcl-sqlite3\nmakehlp.obj
	link $(LDFLAGS) -out:$@ $**
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Other .obj files requiring individual attention, that could not be covered by the inference rules.
# Format is as follows (all dirs must have a trailing '\'):
#
# $(obj_file):
# 	$(CC)|$(CXX) $(cflags) /Fo$(obj_destdir) /c @<<
# $(srcfile)
# <<
$(CFG)\$(PLAT)\sqlite3-dll\sqlite3.res: ..\sqlite3.rc $(CFG)\$(PLAT)\sqlite3-dll\sqlite3rc.h
	rc /fo$@ /DRC_VERONLY /I$(@D) $(SQLITE3_LIB_DEFINES) ..\$(@B).rc

targets: $(CFG)\$(PLAT)\sqlite3-dll\version
	@for /f "delims=" %%x in ($**) do @$(MAKE) /f Makefile.sqlite3.vc $(BUILD_OPTIONS) SQLITE3_VER=%%x

clean:
	@-del /f /q $(CFG)\$(PLAT)\*.lib
	@-del /f /q $(CFG)\$(PLAT)\*.pdb
	@-del /f /q $(CFG)\$(PLAT)\*.exe.manifest
	@-del /f /q $(CFG)\$(PLAT)\*.exe
	@-del /f /q $(CFG)\$(PLAT)\*.dll.manifest
	@-del /f /q $(CFG)\$(PLAT)\*.dll
	@-del /f /q $(CFG)\$(PLAT)\*.ilk
	@-if exist $(CFG)\$(PLAT)\tcl-sqlite3 del /f /q $(CFG)\$(PLAT)\tcl-sqlite3\*.obj
	@-del /f /q $(CFG)\$(PLAT)\sqlite3\*.obj
	@-del /f /q $(CFG)\$(PLAT)\sqlite3-dll\sqlite3.res
	@-del /f /q $(CFG)\$(PLAT)\sqlite3-dll\sqlite3rc.h
	@-del /f /q $(CFG)\$(PLAT)\sqlite3-dll\*.obj
	@-del $(CFG)\$(PLAT)\sqlite3-dll\version
	@-del /f /q vc$(VSVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
