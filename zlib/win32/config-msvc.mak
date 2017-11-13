# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into libmikmod on Windows

# Include zlib source files
!include zlib-sources.mk

!if "$(CFG)" == "release" || "$(CFG)" == "Release"
CFLAGS = $(CFLAGS) /Oy-
!endif
	
ZLIB_CFLAGS =	\
	$(CFLAGS)	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	/DZLIB_DLL

ZLIB_INCLUDES = /I..

ZLIB_SRCS = $(ZLIB_BASE_SRCS)
NMAKE_SAVED_OPTS =

!if "$(USE_ASM_OPT)" == "1"
# Note: the ^ in USE_ASM_OPT^=1 is required!
NMAKE_SAVED_OPTS = $(NMAKE_SAVED_OPTS) USE_ASM_OPT^=1
ASM_DEFINES = -DASMV -DASMINF
ASM_FLAGS = -Zi

!if "$(PLAT)" == "x64"
ZLIB_SRCS = $(ZLIB_SRCS) $(ZLIB_X64_ASM_SRCS)
ASM_FLAGS = $(ASM_FLAGS) $(ASM_DEFINES) -I.
!else
ZLIB_SRCS = $(ZLIB_SRCS) $(ZLIB_X86_ASM_SRCS)
ASM_FLAGS = $(ASM_FLAGS) -coff $(ASM_DEFINES)
!endif

ZLIB_CFLAGS = $(ZLIB_CFLAGS) $(ASM_DEFINES)
!endif

# We build the ZLib DLL/LIB at least
ZLIB_LIB = $(CFG)\$(PLAT)\zlib1.lib

ZLIB_TESTS =	\
	$(CFG)\$(PLAT)\example.exe	\
	$(CFG)\$(PLAT)\minigzip.exe
	
