# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into sqlite3 on Windows
GTK_VER = 2.0

BASE_CFLAGS =	\
	$(CFLAGS)	\
	/DWIN32		\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	/DPACKAGE="pixman-1"	\
	/wd4244

PIXMAN_LIB_CFLAGS = \
	$(BASE_CFLAGS)	\
	/DPACKAGE_VERSION=\"\"	\
	/DPACKAGE_BUGREPORT=\"\"	\
	/DUSE_SSE2

!if "$(PLAT)" == "Win32"
PIXMAN_LIB_CFLAGS =	\
	$(PIXMAN_LIB_CFLAGS)	\
	/DUSE_X86_MMX	\
	/DUSE_SSSE3	\
	/w14710	\
	/w14714
!endif

!if $(VSVER) < 10
PIXMAN_TEST_CFLAGS = $(BASE_CFLAGS) /DUINT16_MAX=_UI16_MAX
!else
PIXMAN_TEST_CFLAGS = $(BASE_CFLAGS)
!endif

PIXMAN_INCLUDES = /I.. /I..\pixman
PIXMAN_EXTRA_TARGETS =

!ifdef GTK2
PIXMAN_DEMOS = $(pixman_demo_progs)
PIXMAN_DEMO_INCLUDES =	\
	/I$(CFG)\$(PLAT)\pixman-ex	\
	/I$(PREFIX)\include\gtk-$(GTK_VER)	\
	/I$(PREFIX)\lib\gtk-$(GTK_VER)\include	\
	/I$(PREFIX)\include\gdk-pixbuf-2.0	\
	/I$(PREFIX)\include\glib-2.0	\
	/I$(PREFIX)\lib\glib-2.0\include	\
	$(PIXMAN_INCLUDES)

PIXMAN_DEMO_CFLAGS =	\
	/D_USE_MATH_DEFINES	\
	$(BASE_CFLAGS)

PIXMAN_DEMO_DEP_LIBS =	\
	gtk-win32-$(GTK_VER).lib	\
	gdk-win32-$(GTK_VER).lib	\
	gdk_pixbuf-2.0.lib	\
	gobject-2.0.lib	\
	glib-2.0.lib	\
	cairo.lib

!else
PIXMAN_DEMOS =
PIXMAN_DEMO_INCLUDES =
PIXMAN_DEMO_CFLAGS =
PIXMAN_DEMO_DEP_LIBS =
!endif

# We build the pixman-1.dll at least
PIXMAN_LIB = $(CFG)\$(PLAT)\pixman-1.lib