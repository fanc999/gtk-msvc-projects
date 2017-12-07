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

# Include pixman source files
!include ..\pixman\Makefile.sources

# Include test source files
!include ..\test\Makefile.sources

# Add the extra sources that we are using for arch optimizations
libpixman_sources =	$(libpixman_sources) pixman-sse2.c

!if "$(PLAT)" == "Win32"
libpixman_sources =	\
	$(libpixman_sources)	\
	pixman-mmx.c	\
	pixman-ssse3.c
!endif

PIXMAN_GTK2_DEMOS =		\
	clip-test		\
	clip-in			\
	composite-test		\
	gradient-test		\
	radial-test		\
	linear-gradient		\
	conical-test		\
	alpha-test		\
	screen-test		\
	convolution-test	\
	trap-test		\
	tri-test		\
	quad2quad		\
	checkerboard		\
	srgb-trap-test		\
	srgb-test		\
	scale

PIXMAN_GTK2_DEMO_UTILS_SRC = gtk-utils.c

# Create the list of .obj files
!if [call create-lists.bat header pixman-msvc.mak pixman_1_OBJS]
!endif

!if [for %c in ($(libpixman_sources)) do @if "%~xc" == ".c" @call create-lists.bat file pixman-msvc.mak ^$(CFG)\^$(PLAT)\pixman-1\%~nc.obj]
!endif

!if [call create-lists.bat footer pixman-msvc.mak]
!endif

!if [call create-lists.bat header pixman-msvc.mak pixman_test_progs]
!endif

!if [for %p in ($(TESTPROGRAMS) $(OTHERPROGRAMS)) do @call create-lists.bat file pixman-msvc.mak ^$(CFG)\^$(PLAT)\%p.exe]
!endif

!if [call create-lists.bat footer pixman-msvc.mak]
!endif

!if [call create-lists.bat header pixman-msvc.mak pixman_demo_progs]
!endif

!if [for %p in ($(PIXMAN_GTK2_DEMOS)) do @call create-lists.bat file pixman-msvc.mak ^$(CFG)\^$(PLAT)\%p.exe]
!endif

!if [call create-lists.bat footer pixman-msvc.mak]
!endif

!if [call create-lists.bat header pixman-msvc.mak pixman_test_util_OBJS]
!endif

!if [for %c in ($(libutils_sources)) do @if "%~xc" == ".c" @call create-lists.bat file pixman-msvc.mak ^$(CFG)\^$(PLAT)\pixman-tests\%~nc.obj]
!endif

!if [call create-lists.bat footer pixman-msvc.mak]
!endif

!if [call create-lists.bat header pixman-msvc.mak pixman_gtk2_demo_util_OBJS]
!endif

!if [for %c in ($(PIXMAN_GTK2_DEMO_UTILS_SRC)) do @if "%~xc" == ".c" @call create-lists.bat file pixman-msvc.mak ^$(CFG)\^$(PLAT)\pixman-ex\%~nc.obj]
!endif

!if [@call create-lists.bat file pixman-msvc.mak ^$(pixman_test_util_OBJS)]
!endif

!if [call create-lists.bat footer pixman-msvc.mak]
!endif

!include pixman-msvc.mak

!if [del /f /q pixman-msvc.mak]
!endif
