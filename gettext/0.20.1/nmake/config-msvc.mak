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

EXTRA_INSTALL_PATHS_DEFINES =	\
	/DLIBPATHVAR=\"PATH\"	\
	/DLIBDIRS=\"c:/vs$(VSVER).0/$(PLAT)/bin\",	\
	/DINSTALLDIR=\"c:/vs$(VSVER).0/$(PLAT)/bin\"

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

FORCED_INCLUDED_HEADERS =	\
	/FIarg-nonnull.h	\
	/FIc++defs.h	\
	/FIwarn-on-use.h	\
	/FI_Noreturn.h

BASE_GETTEXT_RUNTIME_INCLUDES =	\
	/I..\gettext-runtime\gnulib-lib	\
	$(FORCED_INCLUDED_HEADERS)

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
	$(FORCED_INCLUDED_HEADERS)

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

BASE_GETTEXT_TOOLS_INCLUDES =	\
	/I..\gettext-tools\gnulib-lib	\
	$(FORCED_INCLUDED_HEADERS)

GETTEXT_TOOLS_INCLUDES =	\
	/I..\gettext-tools\gnulib-lib\msvc	\
	/I..\gettext-tools\gnulib-lib	\
	/I..\gettext-tools\msvc	\
	$(BASE_GETTEXT_TOOLS_INCLUDES)

GETTEXT_TOOLS_GNULIB_CFLAGS =	\
	$(GETTEXT_RUNTIME_GNULIB_CFLAGS)	\
	/DLIBXML_STATIC=1

LIBGREP_INCLUDES =	\
	/I..\gettext-tools\libgrep\msvc	\
	/I..\gettext-tools\libgrep	\
	$(GETTEXT_TOOLS_INCLUDES)

LIBGREP_CFLAGS =	\
	$(GETTEXT_RUNTIME_GNULIB_CFLAGS)	\
	/DIN_GETTEXT_TOOLS_LIBGREP=1

GETTEXTPO_GNULIB_INCLUDES =	\
	/I..\gettext-tools\libgettextpo\msvc	\
	/I..\gettext-tools\libgettextpo	\
	/I..\gettext-tools\src	\
	/I..\gettext-tools\msvc	\
	/I..\gettext-runtime\intl	\
	$(BASE_GETTEXT_TOOLS_INCLUDES)

LIBGETTEXTPO_DEFINES =	\
	/DIN_LIBGETTEXTPO=1	\
	$(GETTEXT_RUNTIME_GNULIB_CFLAGS)

# We build the libintl DLL/LIB at least
INTL_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\intl.lib
ASPRINTF_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\asprintf.lib
GETTEXTLIB_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\gettextlib-$(GETTEXT_VERSION).lib
GETTEXTPO_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\gettextpo.lib
GRT_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\grt.lib
INTL_CS_DLL = vs$(VSVER)\$(CFG)\$(PLAT)\GNU.Gettext.dll
LIBGREP_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\grep.lib
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
