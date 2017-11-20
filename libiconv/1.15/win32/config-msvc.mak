# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into libiconv on Windows
LIBICONV_VERSION_MAJOR=1
LIBICONV_VERSION_MINOR=15
LIBICONV_VERSION_MICRO=0
LIBICONV_VERSION=$(LIBICONV_VERSION_MAJOR).$(LIBICONV_VERSION_MINOR)

ICONV_BASE_DEFINES =	\
	/DENABLE_RELOCATABLE=1	\
	/DHAVE_CONFIG_H	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	$(CFLAGS)

ICONV_DLL_BASE_DEFINES =	\
	$(ICONV_BASE_DEFINES)	\
	/DBUILDING_DLL	\
	/DIN_LIBRARY	\
	/DNO_XMALLOC

ICONV_BASE_PATH_DEFINES =	\
	/DINSTALLDIR=""	\
	/DLIBDIR=""	\
	/DLOCALEDIR=""

LIBCHARSET_CFLAGS =	\
	$(ICONV_DLL_BASE_DEFINES)	\
	$(ICONV_BASE_PATH_DEFINES)	\
	/DBUILDING_LIBCHARSET	\
	/Dset_relocation_prefix=libcharset_set_relocation_prefix	\
	/Drelocate=libcharset_relocate

LIBICONV_CFLAGS =	\
	$(ICONV_DLL_BASE_DEFINES)	\
	$(ICONV_BASE_PATH_DEFINES)	\
	/DBUILDING_LIBICONV	\
	/DDEPENDS_ON_LIBCHARSET	\
	/Dset_relocation_prefix=libiconv_set_relocation_prefix	\
	/Drelocate=libiconv_relocate

ICONV_CFLAGS =	\
	$(ICONV_BASE_DEFINES)	\
	$(ICONV_BASE_PATH_DEFINES)	\
	/DEXEEXT=\".exe\"

BASE_LIBICONV_INCLUDES =	\
	/I..\build-aux\snippet	\
	/FIarg-nonnull.h	\
	/FIc++defs.h	\
	/FIwarn-on-use.h	\
	/FI_Noreturn.h

LIBCHARSET_INCLUDES =	\
	$(BASE_LIBICONV_INCLUDES)	\
	/I..\libcharset\include\msvc	\
	/I..\libcharset\msvc

LIBICONV_INCLUDES =	\
	$(BASE_LIBICONV_INCLUDES)	\
	/I..\include\msvc	\
	/I..\libcharset\include\msvc	\
	/I..\msvc

ICONV_INCLUDES =	\
	$(BASE_LIBICONV_INCLUDES)	\
	/I..\srclib\msvc	\
	/I..\srclib	\
	/I..\include\msvc	\
	/I..\msvc

LIBICONV_RC_FLAGS =	\
	/dPACKAGE_VERSION_MAJOR=$(LIBICONV_VERSION_MAJOR)	\
	/dPACKAGE_VERSION_MINOR=$(LIBICONV_VERSION_MINOR)	\
	/dPACKAGE_VERSION_SUBMINOR=$(LIBICONV_VERSION_MICRO)	\
	/dPACKAGE_VERSION_STRING=\"$(LIBICONV_VERSION)\"

# We build the libiconv/libcharset DLL/LIB at least
CHARSET_LIB = $(CFG)\$(PLAT)\charset.lib
ICONV_LIB = $(CFG)\$(PLAT)\iconv.lib
ICONV_GNULIB_LIB = $(CFG)\$(PLAT)\iconv-gnulib.lib

LIBICONV_LIBS = $(CHARSET_LIB) $(ICONV_LIB)
ICONV_TOOLS = $(CFG)\$(PLAT)\iconv.exe

!ifdef USE_I18N
ICONV_DEP_LIBS = intl.lib
ICONV_CFLAGS = $(ICONV_CFLAGS) /DUSE_GETTEXT
!else
ICONV_DEP_LIBS =
!endif
