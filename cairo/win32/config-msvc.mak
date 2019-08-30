# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into Cairo on Windows
GTK_VER = 2.0
ENABLED_SURFACE_BACKENDS = WIN32 IMAGE MIME RECORDING OBSERVER
ENABLED_FONT_BACKENDS = WIN32 USER
ENABLED_OPTIONS =
BUILT_DLLS = cairo

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

CAIRO_TEST_SRCS = $(test_sources:	=)
CAIRO_TEST_EXTRA_SOURCES =

CAIRO_INCLUDES = /I.. /I..\src /Ivs$(VSVER)\$(CFG)\$(PLAT)\cairo
CAIRO_BOILERPLATE_INCLUDES = /I..\boilerplate $(CAIRO_INCLUDES)
CAIRO_EXTRA_TARGETS =

CAIRO_TEST_CFLAGS = $(BASE_CFLAGS)
CAIRO_TEST_INCLUDES = /I..\test /I..\test\pdiff $(CAIRO_BOILERPLATE_INCLUDES)

!if $(VSVER) < 14
CAIRO_TEST_CFLAGS = /D__func__=__FUNCTION__ $(CAIRO_TEST_CFLAGS)
!endif

# We build the cairo.dll at least
CAIRO_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\cairo.lib
CAIRO_GOBJECT_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\cairo-gobject.lib
CAIRO_SCRIPT_INTERPRETER_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\cairo-script-interpreter.lib
CAIRO_MAKE_OPTIONS = CFG^=$(CFG)

!ifdef USE_LIBTOOL_DLLNAME
CAIRO_DLL_PREFIX = lib
CAIRO_DLL_SUFFIX = -2
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) USE_LIBTOOL_DLLNAME^=$(USE_LIBTOOL_DLLNAME)
ENABLED_OPTIONS = $(ENABLED_OPTIONS) libtool-style DLL naming
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
ADDITIONAL_FEATURE_QT = QT
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_QT)^=$(QT)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_QT)_SURFACE
ENABLED_SURFACE_BACKENDS = $(ENABLED_SURFACE_BACKENDS) $(ADDITIONAL_FEATURE_QT)
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_qt_cxx_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_qt_cxx_sources)

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
ADDITIONAL_FEATURE_SVG = SVG
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_SVG)^=$(SVG)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_SVG)_SURFACE
ENABLED_SURFACE_BACKENDS = $(ENABLED_SURFACE_BACKENDS) $(ADDITIONAL_FEATURE_SVG)
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_svg_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_svg_sources)
CAIRO_USE_ZLIB = 1
CAIRO_TEST_SRCS = $(CAIRO_TEST_SRCS) $(svg_surface_test_sources:	=)
CAIRO_TEST_EXTRA_SOURCES = $(CAIRO_TEST_EXTRA_SOURCES) $(svg_surface_test_sources:	=)
!endif

!ifdef XML
ADDITIONAL_FEATURE_XML = XML
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_XML)^=$(XML)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_XML)_SURFACE
ENABLED_SURFACE_BACKENDS = $(ENABLED_SURFACE_BACKENDS) $(ADDITIONAL_FEATURE_XML)
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_xml_sources)
!endif

!ifdef PNG
ADDITIONAL_FEATURE_PNG = PNG
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_PNG)^=$(PNG)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_PNG)_FUNCTIONS
ENABLED_OPTIONS = $(ENABLED_OPTIONS) $(ADDITIONAL_FEATURE_PNG) functions
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_png_sources)
CAIRO_ADDITIONAL_LIBS = libpng16.lib
CAIRO_USE_ZLIB = 1
!endif

!ifdef GL
!message GL builds most probably will not link!
# Enable WGL functions as well
# Note: requires glext.h, and does not link in its current form!
ADDITIONAL_FEATURE_GL = GL
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_GL)^=$(GL)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_GL)_SURFACE CAIRO_HAS_W$(ADDITIONAL_FEATURE_GL)_FUNCTIONS
ENABLED_OPTIONS = $(ENABLED_OPTIONS) W$(ADDITIONAL_FEATURE_GL) functions
ENABLED_SURFACE_BACKENDS = $(ENABLED_SURFACE_BACKENDS) $(ADDITIONAL_FEATURE_GL)
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_gl_sources) $(cairo_wgl_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_wgl_sources)
CAIRO_ADDITIONAL_LIBS = $(CAIRO_ADDITIONAL_LIBS) opengl32.lib glu32.lib
CAIRO_TEST_SRCS = $(CAIRO_TEST_SRCS) $(gl_surface_test_sources:	=)
CAIRO_TEST_EXTRA_SOURCES = $(CAIRO_TEST_EXTRA_SOURCES) $(gl_surface_test_sources:	=)
!endif

!ifdef COGL
ADDITIONAL_FEATURE_COGL = COGL
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_COGL)^=$(COGL)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_COGL)_SURFACE
ENABLED_SURFACE_BACKENDS = $(ENABLED_SURFACE_BACKENDS) $(ADDITIONAL_FEATURE_COGL)
# Todo.  Cogl is not really maintained nowadays
!endif

!ifdef SCRIPT
ADDITIONAL_FEATURE_SCRIPT = SCRIPT
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_SCRIPT)^=$(SCRIPT)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_SCRIPT)_SURFACE
ENABLED_SURFACE_BACKENDS = $(ENABLED_SURFACE_BACKENDS) $(ADDITIONAL_FEATURE_SCRIPT)
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_script_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_script_sources)
!endif

!ifdef FONTCONFIG
!ifndef FREETYPE
FREETYPE=1
!endif
ADDITIONAL_FEATURE_FC = FC
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) FONTCONFIG^=$(FONTCONFIG)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_FC)_FONT
ENABLED_FONT_BACKENDS = $(ENABLED_FONT_BACKENDS) $(ADDITIONAL_FEATURE_FC)
CAIRO_FT_DEP_LIBS = fontconfig.lib
CAIRO_TEST_SRCS = $(CAIRO_TEST_SRCS) $(ft_font_test_sources:	=)
CAIRO_TEST_EXTRA_SOURCES = $(CAIRO_TEST_EXTRA_SOURCES) $(ft_font_test_sources:	=)
!endif

!ifdef FREETYPE
ADDITIONAL_FEATURE_FT = FT
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) FREETYPE^=$(FREETYPE)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_FT)_FONT
ENABLED_FONT_BACKENDS = $(ENABLED_FONT_BACKENDS) $(ADDITIONAL_FEATURE_FT)
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_ft_sources)
CAIRO_FT_DEP_LIBS = $(CAIRO_FT_DEP_LIBS) freetype.lib
CAIRO_ADDITIONAL_LIBS = $(CAIRO_FT_DEP_LIBS) $(CAIRO_ADDITIONAL_LIBS)
!endif

# PS and PDF support must be enabled together
!if defined (PS) || defined (PDF)
ADDITIONAL_FEATURE_PS_PDF = PS PDF
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) PDF=1 PS=1
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_PS_SURFACE CAIRO_HAS_PDF_SURFACE CAIRO_HAS_MULTI_PAGE_SURFACES
ENABLED_SURFACE_BACKENDS = $(ENABLED_SURFACE_BACKENDS) $(ADDITIONAL_FEATURE_PS_PDF) MULTI_PAGE
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_pdf_sources) $(cairo_ps_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_pdf_sources)  $(cairo_boilerplate_ps_sources)
CAIRO_USE_ZLIB = 1
!ifdef CAIRO_TEST_PS
CAIRO_TEST_SRCS = $(CAIRO_TEST_SRCS) $(ps_surface_test_sources:	=)
CAIRO_TEST_EXTRA_SOURCES = $(CAIRO_TEST_EXTRA_SOURCES) $(ps_surface_test_sources:	=)
!endif
!ifdef CAIRO_TEST_PDF
CAIRO_TEST_SRCS = $(CAIRO_TEST_SRCS) $(pdf_surface_test_sources:	=)
CAIRO_TEST_EXTRA_SOURCES = $(CAIRO_TEST_EXTRA_SOURCES) $(pdf_surface_test_sources:	=)
!endif
CAIRO_TEST_SRCS = $(CAIRO_TEST_SRCS) $(multi_page_surface_test_sources:	=)
CAIRO_TEST_EXTRA_SOURCES = $(CAIRO_TEST_EXTRA_SOURCES) $(multi_page_surface_test_sources:	=)
!endif

!if defined (PS) || defined (PDF) || defined (SVG)
CAIRO_TEST_SRCS = $(CAIRO_TEST_SRCS) $(fallback_resolution_test_sources:	=)
CAIRO_TEST_EXTRA_SOURCES = $(CAIRO_TEST_EXTRA_SOURCES) $(fallback_resolution_test_sources:	=)
!endif


!ifdef TEST_SURFACES
ADDITIONAL_FEATURE_TEST = TEST_SURFACES
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_TEST)^=$(TEST_SURFACES)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_TEST)
ENABLED_SURFACE_BACKENDS = $(ENABLED_SURFACE_BACKENDS) $(ADDITIONAL_FEATURE_TEST)
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_test_surfaces_sources)
CAIRO_BOILERPLATE_SRCS = $(CAIRO_BOILERPLATE_SRCS) $(cairo_boilerplate_test_surfaces_sources)
!endif

!ifdef TEE
ADDITIONAL_FEATURE_TEE = TEE
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_TEE)^=$(TEST_SURFACES)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_TEE)_SURFACE
ENABLED_SURFACE_BACKENDS = $(ENABLED_SURFACE_BACKENDS) $(ADDITIONAL_FEATURE_TEE)
CAIRO_LIB_SRCS = $(CAIRO_LIB_SRCS) $(cairo_tee_sources)
!endif

!ifdef GOBJECT
# cairo-gobject is a separate DLL
ADDITIONAL_FEATURE_GOBJECT = GOBJECT
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_GOBJECT)^=$(GOBJECT)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_GOBJECT)_FUNCTIONS
ENABLED_OPTIONS = $(ENABLED_OPTIONS) $(ADDITIONAL_FEATURE_GOBJECT) functions
CAIRO_GOBJECT_INCLUDES = $(CAIRO_INCLUDES) /I$(PREFIX)\include\glib-2.0 /I$(PREFIX)\lib\glib-2.0\include /wd4273
CAIRO_GOBJECT_DEP_LIBS = $(CAIRO_LIB) gobject-2.0.lib glib-2.0.lib $(CAIRO_DEP_LIBS)
CAIRO_LIBS = $(CAIRO_LIBS) $(CAIRO_GOBJECT_LIB)
BUILT_DLLS = $(BUILT_DLLS) cairo-gobject
!endif

!ifdef INTERPRETER
# cairo-script-interpreter is a separate DLL
ADDITIONAL_FEATURE_INTERPRETER = INTERPRETER
CAIRO_MAKE_OPTIONS = $(CAIRO_MAKE_OPTIONS) $(ADDITIONAL_FEATURE_INTERPRETER)^=$(INTERPRETER)
CAIRO_ADDITIONAL_FEATURES = $(CAIRO_ADDITIONAL_FEATURES) CAIRO_HAS_$(ADDITIONAL_FEATURE_INTERPRETER)
ENABLED_OPTIONS = $(ENABLED_OPTIONS) SCRIPT $(ADDITIONAL_FEATURE_INTERPRETER)
CAIRO_LIBS = $(CAIRO_LIBS) $(CAIRO_SCRIPT_INTERPRETER_LIB)
CAIRO_SCRIPT_CFLAGS = /Ivs$(VSVER)\$(CFG)\$(PLAT)\cairo-script $(CAIRO_INCLUDES) /wd4273
BUILT_DLLS = $(BUILT_DLLS) cairo-script-interpreter

CAIRO_UTILS =	\
	vs$(VSVER)\$(CFG)\$(PLAT)\csi-replay.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\csi-exec.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\csi-bind.exe
!endif

!if "$(CAIRO_USE_ZLIB)" == "1"
CAIRO_ADDITIONAL_LIBS = $(CAIRO_ADDITIONAL_LIBS) zlib1.lib
!ifdef INTERPRETER
CAIRO_SCRIPT_CFLAGS = $(CAIRO_SCRIPT_CFLAGS) /DHAVE_ZLIB=1
!endif
!endif

!if defined (DIRECT2D) || defined (DIRECTWRITE)
BASE_CFLAGS = $(BASE_CFLAGS) /DCAIRO_WIN32_DIRECT2D /D_WIN32_WINNT=0x0601 /D_WIN7_PLATFORM_UPDATE
CAIRO_ADDITIONAL_LIBS = $(CAIRO_ADDITIONAL_LIBS) d3d11.lib d2d1.lib dwrite.lib dxgi.lib windowscodecs.lib dxguid.lib ole32.lib

# We need the headers from at least the Windows 8 SDK...
!if $(VSVER) < 11
CAIRO_INCLUDES = $(CAIRO_INCLUDES) /I"$(WIN8_SDK_DIR)\include\um" /I"$(WIN8_SDK_DIR)\include\shared"
LDFLAGS = $(LDFLAGS) /libpath:"$(WIN8_SDK_DIR)\lib\win8\um\$(MACHINE_ID_STRING)"
!endif

!endif

CAIRO_DEP_LIBS = $(CAIRO_ADDITIONAL_LIBS) $(CAIRO_DEP_LIBS)