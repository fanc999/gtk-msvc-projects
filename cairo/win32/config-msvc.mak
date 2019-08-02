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
	/wd4244	\
	/wd4146

CAIRO_DEP_LIBS =	\
	pixman-1.lib	\
	gdi32.lib	\
	msimg32.lib	\
	user32.lib

CAIRO_LIB_SRCS =	\
	$(cairo_sources)	\
	$(_cairo_font_subset_sources)	\
	$(_cairo_pdf_operators_sources)	\
	$(_cairo_deflate_stream_sources)	\
	$(cairo_win32_sources)	\
	$(cairo_win32_font_sources)

CAIRO_BOILERPLATE_SRCS =	\
	$(cairo_boilerplate_sources)	\
	$(cairo_boilerplate_win32_sources)

CAIRO_BOILERPLATES = win32 win32_printing

CAIRO_INCLUDES = /I.. /I..\src /I$(CFG)\$(PLAT)\cairo
CAIRO_BOILERPLATE_INCLUDES = /I..\boilerplate $(CAIRO_INCLUDES)
CAIRO_EXTRA_TARGETS =

# We build the cairo.dll at least
CAIRO_LIB = $(CFG)\$(PLAT)\cairo.lib
CAIRO_GOBJECT_LIB = $(CFG)\$(PLAT)\cairo-gobject.lib
CAIRO_SCRIPT_INTERPRETER_LIB = $(CFG)\$(PLAT)\cairo-script-interpreter.lib
CAIRO_MAKE_OPTIONS = CFG^=$(CFG)

!ifdef USE_LIBTOOL_DLLNAME
CAIRO_DLL_PREFIX = lib
CAIRO_DLL_SUFFIX = -2
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) USE_LIBTOOL_DLLNAME^=$(USE_LIBTOOL_DLLNAME)
!else
CAIRO_DLL_PREFIX =
CAIRO_DLL_SUFFIX = -vs$(PDBVER)
!endif

CAIRO_LIBS = $(CAIRO_LIB)
CAIRO_UTILS =
CAIRO_ADDITIONAL_FEATURES =
CAIRO_ADDITIONAL_LIBS =

QT_ADDITIONAL_LDFLAGS =

!ifdef QT
# Only QT-4.x is supported currently!
# FreeType support is required for this
!ifndef FREETYPE
FREETYPE=1
!endif
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) QT^=$(QT)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_QT_SURFACE
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_qt_cxx_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_qt_cxx_sources)
CAIRO_BOILERPLATES = $(CAIRO_BOILERPLATES) qt

CAIRO_INCLUDES = $(CAIRO_INCLUDES) /Imsvc-compat

!if "$(CFG)" == "Debug" || "$(CFG)" == "debug"
QT_DEBUG_SUFFIX = d
!else
QT_DEBUG_SUFFIX =
!endif

# We want to delay-load the QT DLLs as they pull in a number
# of dependent DLLs of their own.  Include these DLLs as needed.
QT_ADDITIONAL_LDFLAGS =	\
	qtgui4$(QT_DEBUG_SUFFIX).lib	\
	qtcore4$(QT_DEBUG_SUFFIX).lib	\
	/delayload:qtgui4$(QT_DEBUG_SUFFIX).dll	\
	/delayload:qtcore4$(QT_DEBUG_SUFFIX).dll	\
	delayimp.lib

!ifdef QTDIR
CAIRO_INCLUDES = $(CAIRO_INCLUDES) /I$(QTDIR)\include\QtGui /I$(QTDIR)\include
!if $(VSVER) > 9
CAIRO_QT_INCLUDES = $(CAIRO_INCLUDES) /DHAVE_STDINT_H
!else
CAIRO_QT_INCLUDES = $(CAIRO_INCLUDES)
!endif
QT_ADDITIONAL_LDFLAGS = $(QT_ADDITIONAL_LDFLAGS) /libpath:$(QTDIR)\lib
!endif

!endif

!if defined (SVG) || defined (XML)
# The PNG functions are required for the SVG surface
!ifndef PNG
PNG = 1
!endif
!endif

!ifdef SVG
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) SVG^=$(SVG)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_SVG_SURFACE
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_svg_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_svg_sources)
CAIRO_BOILERPLATES = $(CAIRO_BOILERPLATES) svg
CAIRO_USE_ZLIB = 1
!endif

!ifdef XML
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) XML^=$(XML)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_XML_SURFACE
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_xml_sources)
!endif

!ifdef PNG
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) PNG^=$(PNG)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_PNG_FUNCTIONS
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_png_sources)
CAIRO_ADDITIONAL_LIBS = libpng16.lib
CAIRO_USE_ZLIB = 1
!endif

!ifdef GL
!message GL builds most probably will not link!
# Enable WGL functions as well
# Note: requires glext.h, and does not link in its current form!
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) GL^=$(GL)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_GL_SURFACE CAIRO_HAS_WGL_FUNCTIONS
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_gl_sources) $(cairo_wgl_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_wgl_sources)
CAIRO_BOILERPLATES = $(CAIRO_BOILERPLATES) wgl
CAIRO_ADDITIONAL_LIBS = $(CAIRO_ADDITIONAL_LIBS) opengl32.lib glu32.lib
!endif

!ifdef COGL
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) COGL^=$(COGL)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_COGL_SURFACE
# Todo.  Cogl is not really maintained nowadays
!endif

!ifdef SCRIPT
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) SCRIPT^=$(SCRIPT)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_SCRIPT_SURFACE
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_script_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_script_sources)
CAIRO_BOILERPLATES = $(CAIRO_BOILERPLATES) script
!endif

!ifdef FONTCONFIG
!ifndef FREETYPE
FREETYPE=1
!endif
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) FONTCONFIG^=$(FONTCONFIG)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_FC_FONT
CAIRO_FT_DEP_LIBS = fontconfig.lib
!endif

!ifdef FREETYPE
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) FREETYPE^=$(FREETYPE)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_FT_FONT
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_ft_sources)
CAIRO_FT_DEP_LIBS = $(CAIRO_FT_DEP_LIBS) freetype.lib
CAIRO_ADDITIONAL_LIBS = $(CAIRO_FT_DEP_LIBS) $(CAIRO_ADDITIONAL_LIBS)
!endif

# PS and PDF support must be enabled together
!if defined (PS) || defined (PDF)
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) PDF=1 PS=1
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_PS_SURFACE CAIRO_HAS_PDF_SURFACE
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_pdf_sources) $(cairo_ps_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_pdf_sources)  $(cairo_boilerplate_ps_sources)
CAIRO_BOILERPLATES = $(CAIRO_BOILERPLATES) pdf ps
CAIRO_USE_ZLIB = 1
!endif

!ifdef TEST_SURFACES
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) TEST_SURFACES^=$(TEST_SURFACES)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_TEST_SURFACES
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_test_surfaces_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_test_surfaces_sources)
CAIRO_BOILERPLATES = $(CAIRO_BOILERPLATES) test_surfaces
!endif

!ifdef TEE
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) TEE^=$(TEE)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_TEE_SURFACE
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_tee_sources)
!endif

!ifdef GOBJECT
# cairo-gobject is a separate DLL
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) GOBJECT^=$(GOBJECT)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_GOBJECT_FUNCTIONS
CAIRO_GOBJECT_INCLUDES = $(CAIRO_INCLUDES) /I$(PREFIX)\include\glib-2.0 /I$(PREFIX)\lib\glib-2.0\include /wd4273
CAIRO_GOBJECT_DEP_LIBS = $(CAIRO_LIB) gobject-2.0.lib glib-2.0.lib $(CAIRO_DEP_LIBS)
CAIRO_LIBS = $(CAIRO_LIBS) $(CAIRO_GOBJECT_LIB)
!endif

!ifdef INTERPRETER
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) INTERPRETER^=$(INTERPRETER)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_INTERPRETER
CAIRO_LIBS = $(CAIRO_LIBS) $(CAIRO_SCRIPT_INTERPRETER_LIB)
CAIRO_SCRIPT_CFLAGS = /I$(CFG)\$(PLAT)\cairo-script $(CAIRO_INCLUDES) /wd4273

CAIRO_UTILS =	\
	$(CFG)\$(PLAT)\csi-replay.exe	\
	$(CFG)\$(PLAT)\csi-exec.exe	\
	$(CFG)\$(PLAT)\csi-bind.exe
!endif

!if "$(CAIRO_USE_ZLIB)" == "1"
CAIRO_ADDITIONAL_LIBS = $(CAIRO_ADDITIONAL_LIBS) zlib1.lib
!ifdef INTERPRETER
CAIRO_SCRIPT_CFLAGS = $(CAIRO_SCRIPT_CFLAGS) /DHAVE_ZLIB=1
!endif
!endif

CAIRO_DEP_LIBS = $(CAIRO_ADDITIONAL_LIBS) $(CAIRO_DEP_LIBS)
