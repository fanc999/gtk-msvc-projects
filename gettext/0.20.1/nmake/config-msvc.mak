# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into libiconv on Windows
GETTEXT_VERSION_MAJOR=0
GETTEXT_VERSION_MINOR=20
GETTEXT_VERSION_MICRO=1
GETTEXT_VERSION=$(GETTEXT_VERSION_MAJOR).$(GETTEXT_VERSION_MINOR).$(GETTEXT_VERSION_MICRO)

GETTEXT_BASE_DEFINES =	\
	/DENABLE_RELOCATABLE=1	\
	/DHAVE_CONFIG_H	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	$(CFLAGS)

GETTEXT_RUNTIME_BASE_DEFINES =	\
	$(GETTEXT_BASE_DEFINES)	\
	/DBUILDING_DLL	\
	/DIN_LIBRARY	\
	/DNO_XMALLOC

GETTEXT_BASE_PATH_DEFINES =	\
	/DINSTALLDIR=""	\
	/DLIBDIR=""	\
	/DLOCALEDIR=\"\"	\
	/DLOCALE_ALIAS_PATH=\"\"

GETTEXT_RUNTIME_CFLAGS =	\
	$(GETTEXT_RUNTIME_BASE_DEFINES)	\
	$(GETTEXT_BASE_PATH_DEFINES)	\
	/DBUILDING_LIBINTL	\
	/DIN_LIBINTL	\
	/DDEPENDS_ON_LIBICONV=1	\
	/Dset_relocation_prefix=libintl_set_relocation_prefix	\
	/Drelocate=libintl_relocate	\
	/Drelocate2=libintl_relocate2

GETTEXT_RUNTIME_GNULIB_CFLAGS =	\
	$(GETTEXT_BASE_DEFINES)	\
	$(GETTEXT_BASE_PATH_DEFINES)	\
	/DDEPENDS_ON_LIBICONV=1	\
	/DDEPENDS_ON_LIBINTL=1	\
	/DEXEEXT=\".exe\"

GETTEXT_RUNTIME_DEP_LIBS = iconv.lib advapi32.lib

ICONV_CFLAGS =	\
	$(ICONV_BASE_DEFINES)	\
	$(ICONV_BASE_PATH_DEFINES)	\
	/DEXEEXT=\".exe\"

BASE_GETTEXT_RUNTIME_INCLUDES =	\
	/I..\gettext-runtime\gnulib-lib	\
	/FIarg-nonnull.h	\
	/FIc++defs.h	\
	/FIwarn-on-use.h	\
	/FI_Noreturn.h

GETTEXT_RUNTIME_INCLUDES =	\
	/I..\gettext-runtime\intl\msvc	\
	/I..\gettext-runtime\intl	\
	/I..\gettext-runtime\msvc	\
	$(BASE_GETTEXT_RUNTIME_INCLUDES)

GETTEXT_RUNTIME_GNULIB_INCLUDES =	\
	/I..\gettext-runtime\gnulib-lib\msvc	\
	/I..\gettext-runtime\gnulib-lib	\
	$(GETTEXT_RUNTIME_INCLUDES)

!if "$(VSVER)" == "9"
GETTEXT_RUNTIME_INCLUDES =	\
	$(GETTEXT_RUNTIME_INCLUDES)	\
	/I..\gettext-runtime\intl\msvc\9.0
!endif

GETTEXT_INCLUDES =	\
	/I..\msvc\include	\
	/I..\libcharset\msvc\include	\
	/I..\msvc	\
	$(BASE_GETTEXT_RUNTIME_INCLUDES)

ASPRINTF_INCLUDES =	\
	/I..\gettext-runtime\libasprintf\msvc	\
	/I..\gettext-runtime\libasprintf	\
	/I..\gettext-runtime\msvc	\
	$(BASE_GETTEXT_RUNTIME_INCLUDES)

ASPRINTF_DEFINES =	\
	/DIN_LIBASPRINTF=1	\
	$(GETTEXT_BASE_DEFINES)

GETTEXT_RC_FLAGS =	\
	/dPACKAGE_VERSION_MAJOR=$(GETTEXT_VERSION_MAJOR)	\
	/dPACKAGE_VERSION_MINOR=$(GETTEXT_VERSION_MINOR)	\
	/dPACKAGE_VERSION_SUBMINOR=$(GETTEXT_VERSION_MICRO)	\
	/dPACKAGE_VERSION_STRING=\"$(GETTEXT_VERSION)\"

BASE_LIBTEXTSTYLE_INCLUDES =	\
	/I..\libtextstyle\lib	\
	/FIarg-nonnull.h	\
	/FIc++defs.h	\
	/FIwarn-on-use.h	\
	/FI_Noreturn.h

LIBTEXTSTYLE_INCLUDES =	\
	/I..\libtextstyle\lib\libcroco	\
	/I..\libtextstyle\lib\msvc\glib	\
	/I..\libtextstyle\lib\msvc	\
	/I..\libtextstyle\lib	\
	/I..\libtextstyle\msvc	\
	$(BASE_LIBTEXTSTYLE_INCLUDES)

LIBTEXTSTYLE_DEFINES =	\
	/DIN_LIBTEXTSTYLE=1	\
	/DDEPENDS_ON_LIBICONV=1	\
	/DLIBXML_STATIC=1	\
	$(GETTEXT_BASE_DEFINES)

# We build the libintl DLL/LIB at least
INTL_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\intl.lib
ASPRINTF_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\asprintf.lib
INTL_CS_DLL = vs$(VSVER)\$(CFG)\$(PLAT)\GNU.Gettext.dll
GRT_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\grt.lib
LIBTEXTSTYLE_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\textstyle.lib

GETTEXT_RUNTIME_LIBS =	\
	$(ASPRINTF_LIB)	\
	$(INTL_LIB)	\
	$(INTL_CS_DLL)

ICONV_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\iconv.lib
ICONV_GNULIB_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\iconv-gnulib.lib

GETTEXT_LIBS = $(CHARSET_LIB) $(ICONV_LIB)
ICONV_TOOLS = vs$(VSVER)\$(CFG)\$(PLAT)\iconv.exe

!ifdef USE_I18N
ICONV_DEP_LIBS = intl.lib
ICONV_CFLAGS = $(ICONV_CFLAGS) /DUSE_GETTEXT
!else
ICONV_DEP_LIBS =
!endif
