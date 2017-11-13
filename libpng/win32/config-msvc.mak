# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into libmikmod on Windows

# libpng release series, 15 for libpng-1.5x, 16 for libpng-1.6.x
PNG_RELEASE_SERIES = 16

PNG_CFLAGS =	\
	$(CFLAGS)	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS
	
LIBPNG_CFLAGS =	\
	$(PNG_CFLAGS)	\
	/DDLL_EXPORT

LIBPNG_INCLUDES = /I. /I..

# We build the liblibpng DLL/LIB at least
PNG_LIB = $(CFG)\$(PLAT)\libpng$(PNG_RELEASE_SERIES).lib

LIBPNG_DEP_LIBS = zlib1.lib

PNG_TOOLS =	\
	$(CFG)\$(PLAT)\checksum-icc.exe	\
	$(CFG)\$(PLAT)\png-fix-itxt.exe	\
	$(CFG)\$(PLAT)\pngfix.exe

PNG_TESTS =	\
	$(CFG)\$(PLAT)\pngtest.exe	\
	$(CFG)\$(PLAT)\fakepng.exe	\
	$(CFG)\$(PLAT)\pngimage.exe	\
	$(CFG)\$(PLAT)\pngstest.exe	\
	$(CFG)\$(PLAT)\pngunknown.exe	\
	$(CFG)\$(PLAT)\pngvalid.exe	\
	$(CFG)\$(PLAT)\readpng.exe	\
	$(CFG)\$(PLAT)\timepng.exe

!if $(VSVER) > 11
PNG_TOOLS =	\
	$(PNG_TOOLS)	\
	$(CFG)\$(PLAT)\genpng.exe	\
	$(CFG)\$(PLAT)\makesRGB.exe

PNG_TESTS =	\
	$(PNG_TESTS)	\
	$(CFG)\$(PLAT)\makepng.exe
!endif
