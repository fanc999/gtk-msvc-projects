# Convert the source listing to object (.obj) listing in
# another NMake Makefile module, include it, and clean it up.
# This is a "fact-of-life" regarding NMake Makefiles...
# This file does not need to be changed unless one is maintaining the NMake Makefiles

# For those wanting to add things here:
# To add a list, do the following:
# # $(description_of_list)
# if [call create-lists.bat header $(makefile_snippet_file) $(variable_name)]
# endif
#
# if [call create-lists.bat file $(makefile_snippet_file) $(file_name)]
# endif
#
# if [call create-lists.bat footer $(makefile_snippet_file)]
# endif
# ... (repeat the if [call ...] lines in the above order if needed)
# !include $(makefile_snippet_file)
#
# (add the following after checking the entries in $(makefile_snippet_file) is correct)
# (the batch script appends to $(makefile_snippet_file), you will need to clear the file unless the following line is added)
#!if [del /f /q $(makefile_snippet_file)]
#!endif

# In order to obtain the .obj filename that is needed for NMake Makefiles to build DLLs/static LIBs or EXEs, do the following
# instead when doing 'if [call create-lists.bat file $(makefile_snippet_file) $(file_name)]'
# (repeat if there are multiple $(srcext)'s in $(source_list), ignore any headers):
# !if [for %c in ($(source_list)) do @if "%~xc" == ".$(srcext)" @call create-lists.bat file $(makefile_snippet_file) $(intdir)\%~nc.obj]
#
# $(intdir)\%~nc.obj needs to correspond to the rules added in build-rules-msvc.mak
# %~xc gives the file extension of a given file, %c in this case, so if %c is a.cc, %~xc means .cc
# %~nc gives the file name of a given file without extension, %c in this case, so if %c is a.cc, %~nc means a

NULL=

# Create the lists of actual source file paths

# Create the list of .obj files
!if [call create-lists.bat header cairo-msvc.mak cairo_dll_OBJS]
!endif

!if [for %c in ($(CAIRO_LIB_SRCS)) do @if "%~xc" == ".c" @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo\%~nc.obj]
!endif

!if [for %c in ($(CAIRO_LIB_SRCS)) do @if "%~xc" == ".cpp" @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo\%~nc.obj]
!endif

!if [call create-lists.bat footer cairo-msvc.mak]
!endif

!if [call create-lists.bat header cairo-msvc.mak cairo_gobject_dll_OBJS]
!endif

!if [for %c in (..\util\cairo-gobject\*.c) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-gobject\%~nc.obj]
!endif

!if [call create-lists.bat footer cairo-msvc.mak]
!endif

!if [call create-lists.bat header cairo-msvc.mak cairo_script_dll_OBJS]
!endif

!if [for %c in ($(libcairo_script_interpreter_sources)) do @if "%~xc" == ".c" @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-script\%~nc.obj]
!endif

!if [call create-lists.bat footer cairo-msvc.mak]
!endif

!if [call create-lists.bat header cairo-msvc.mak cairo_boilerplate_OBJS]
!endif

!if [for %c in (cairo-boilerplate-constructors.c $(CAIRO_BOILERPLATE_SRCS)) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-boilerplate\%~nc.obj]
!endif

!if [call create-lists.bat footer cairo-msvc.mak]
!endif

!if [call create-lists.bat header cairo-msvc.mak libpdiff_OBJS]
!endif

!if [for %c in (lpyramid.c pdiff.c) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-tests\%~nc.obj]
!endif

!if [call create-lists.bat footer cairo-msvc.mak]
!endif

# I hate U1095...
!if [call create-lists.bat header cairo-msvc.mak cairo_test_OBJS]
!endif

!if [for %c in (cairo-test-constructors.c $(test_sources_1)) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-tests\%~nc.obj]
!endif

!if [for %c in ($(test_sources_2)) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-tests\%~nc.obj]
!endif

!if [for %c in ($(test_sources_3)) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-tests\%~nc.obj]
!endif

!if [for %c in ($(test_sources_4)) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-tests\%~nc.obj]
!endif

!if [for %c in ($(test_sources_5)) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-tests\%~nc.obj]
!endif

!if [for %c in ($(test_sources_6)) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-tests\%~nc.obj]
!endif

!if [for %c in ($(CAIRO_TEST_EXTRA_SOURCES) $(cairo_test_suite_sources)) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-tests\%~nc.obj]
!endif

!if [call create-lists.bat footer cairo-msvc.mak]
!endif

!if [call create-lists.bat header cairo-msvc.mak pdiff_OBJS]
!endif

!if [for %c in (args.c perceptualdiff.c) do @call create-lists.bat file cairo-msvc.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\cairo-tests\%~nc.obj]
!endif

!if [call create-lists.bat footer cairo-msvc.mak]
!endif

!include cairo-msvc.mak

!if [del /f /q cairo-msvc.mak]
!endif
