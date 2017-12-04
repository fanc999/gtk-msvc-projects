# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into sqlite3 on Windows

#Note that the '^' before the '=' signs are necessary!
SQLITE3_DEP_LIBS =
BUILD_OPTIONS = CFG^=$(CFG)

!ifdef ICU
BUILD_OPTIONS = $(BUILD_OPTIONS) ICU^=$(ICU)
!endif

!ifdef TCL
BUILD_OPTIONS = $(BUILD_OPTIONS) TCL^=$(TCL)
!endif

!ifndef TCLVER
TCLVER = 86
!endif

!ifndef SQLITE3_VER
SQLITE3_VER = 0000
!endif

BASE_CFLAGS =	\
	$(CFLAGS)	\
	/DWIN32		\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS

SQLITE3_LIB_DEFINES = \
	/DSQLITE_THREADSAFE=1	\
	/DSQLITE_ENABLE_FTS4=1	\
	/DSQLITE_ENABLE_RTREE=1	\
	/DSQLITE_ENABLE_JSON1=1	\
	/DSQLITE_ENABLE_COLUMN_METADATA=1	\
	/DSQLITE_ENABLE_EXPLAIN_COMMENTS=1

!if "$(ICU)" == "1"
SQLITE3_LIB_DEFINES = $(SQLITE3_LIB_DEFINES) /DSQLITE_ENABLE_ICU=1
SQLITE3_DEP_LIBS = $(SQLITE3_DEP_LIBS) icuin.lib icuuc.lib
!endif

!if "$(UWP)" == "1"
!if $(VSVER) >= 11
SQLITE3_LIB_DEFINES = $(SQLITE3_LIB_DEFINES) /DSQLITE_OS_WINRT=1
!else
!message UWP/WinRT builds supported on Visual Studio 2012 or later.  Regular build done here.
!endif
!endif

SQLITE3_LIB_CFLAGS =	\
	$(BASE_CFLAGS)	\
	$(SQLITE3_LIB_DEFINES)	\
	/DSQLITE_API=__declspec(dllexport)

SQLITE3_USE_CFLAGS =	\
	$(BASE_CFLAGS)	\
	/DSQLITE_API=__declspec(dllimport)

SQLITE3_TCL_CFLAGS =	\
	$(SQLITE3_USE_CFLAGS)	\
	/DPACKAGE_VERSION="\"$(SQLITE3_VER)\""	\
	/DUSE_TCL_STUBS	\
	/DBUILD_sqlite	\
	/DUSE_SYSTEM_SQLITE=1

TCL_SQLITE3_DEP_LIBS = tclstub$(TCLVER).lib

SQLITE3_INCLUDES = /I..
SQLITE3_EXTRA_TARGETS =

# We build the sqlite3.dll with the sqlite3 tool at least
SQLITE3_LIB = $(CFG)\$(PLAT)\sqlite3.lib
TCL_SQLITE3_LIB = $(CFG)\$(PLAT)\sqlite3$(SQLITE3_VER_NUM)t.dll
SQLITE3_TOOL = $(CFG)\$(PLAT)\sqlite3.exe

!if "$(TCL)" == "1"
SQLITE3_EXTRA_TARGETS = $(SQLITE3_EXTRA_TARGETS) $(TCL_SQLITE3_LIB)
!endif