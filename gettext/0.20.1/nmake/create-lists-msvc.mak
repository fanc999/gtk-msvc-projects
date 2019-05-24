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

# Include iconv source files
!include gettext-runtime-sources.mk

# Create the list of .obj files
!if [call create-lists.bat header gettext-runtime-objs.mak intl_runtime_OBJS]
!endif

!if [for %c in ($(INTL_RUNTIME_SRCS)) do @if "%~xc" == ".c" @call create-lists.bat file gettext-runtime-objs.mak ^vs$(VSVER)\^$(CFG)\^$(PLAT)\intl-runtime\%~nc.obj]
!endif

!if [@call create-lists.bat file gettext-runtime-objs.mak ^vs$(VSVER)\^$(CFG)\^$(PLAT)\intl-runtime\libintl.res]
!endif

!if [call create-lists.bat footer gettext-runtime-objs.mak]
!endif

!if [call create-lists.bat header gettext-runtime-objs.mak grt_OBJS]
!endif

!if [for %c in ($(GETTEXT_RUNTIME_BASE_GNULIB_SRCS)) do @if "%~xc" == ".c" @call create-lists.bat file gettext-runtime-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\grt\%~nc.obj]
!endif

!if [for %s in (..\gettext-runtime\gnulib-lib\glthread\*.c) do @call create-lists.bat file gettext-runtime-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\grt\%~ns.obj]
!endif

!if [for %s in (..\gettext-runtime\gnulib-lib\unistr\*.c) do @call create-lists.bat file gettext-runtime-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\grt\%~ns.obj]
!endif

!if [for %s in (..\gettext-runtime\gnulib-lib\uniwidth\*.c) do @call create-lists.bat file gettext-runtime-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\grt\%~ns.obj]
!endif

!if [call create-lists.bat footer gettext-runtime-objs.mak]
!endif

!if [call create-lists.bat header gettext-runtime-objs.mak libasprintf_OBJS]
!endif

!if [for %s in (lib-asprintf.c xsize.c) do @call create-lists.bat file gettext-runtime-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\asprintf\%~ns.obj]
!endif

!if [for %s in (..\gettext-runtime\libasprintf\*.cc) do @call create-lists.bat file gettext-runtime-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\asprintf\%~ns.obj]
!endif

!if [@call create-lists.bat file gettext-runtime-objs.mak ^vs$(VSVER)\^$(CFG)\^$(PLAT)\asprintf\libasprintf.res]
!endif

!if [call create-lists.bat footer gettext-runtime-objs.mak]
!endif

!if [call create-lists.bat header gettext-runtime-objs.mak gettext_runtime_tools]
!endif

!if [for %s in (..\gettext-runtime\src\*.c) do @call create-lists.bat file gettext-runtime-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\%~ns.exe]
!endif

!if [call create-lists.bat footer gettext-runtime-objs.mak]
!endif

!include gettext-runtime-objs.mak

!if [del /f /q gettext-runtime-objs.mak]
!endif

# libtextstyle
!include libtextstyle-sources.mk

!if [call create-lists.bat header libtextstyle-objs.mak libtextstyle_OBJS]
!endif

!if [for %s in ($(LIBTEXTSTYLE_BASE_SRCS)) do @call create-lists.bat file libtextstyle-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\libtextstyle\%~ns.obj ]
!endif

!if [for %s in (..\libtextstyle\lib\libcroco\*.c) do @call create-lists.bat file libtextstyle-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\libtextstyle\%~ns.obj ]
!endif

!if [for %s in (..\libtextstyle\lib\glib\*.c) do @call create-lists.bat file libtextstyle-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\libtextstyle\%~ns.obj ]
!endif

!if [for %s in (..\libtextstyle\lib\libxml\*.c) do @call create-lists.bat file libtextstyle-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\libtextstyle\libxml\%~ns.obj ]
!endif

!if [for %s in (..\libtextstyle\lib\unistr\*.c) do @call create-lists.bat file libtextstyle-objs.mak vs^$(VSVER)\^$(CFG)\^$(PLAT)\libtextstyle\%~ns.obj ]
!endif

!if [@call create-lists.bat file libtextstyle-objs.mak ^vs$(VSVER)\^$(CFG)\^$(PLAT)\libtextstyle\libtextstyle.res]
!endif

!if [call create-lists.bat footer libtextstyle-objs.mak]
!endif

!include libtextstyle-objs.mak

#!if [del /f /q libtextstyle-objs.mak]
#!endif
