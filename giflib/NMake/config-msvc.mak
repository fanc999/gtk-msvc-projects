# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into libmikmod on Windows

# Include giflib source files
!include giflib-sources.mk
	
GIFLIB_BASE_CFLAGS =	\
	$(CFLAGS)	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS

GIFLIB_CFLAGS =	\
	$(GIFLIB_BASE_CFLAGS)	\
	/DGIFLIB_BUILD

GIFLIB_INCLUDES = /I..

# We build the libgif DLL/LIB and buildable tools at least
GIFLIB_LIB = $(CFG)\$(PLAT)\libgif.lib

GIFLIB_UTILS =	\
	$(CFG)\$(PLAT)\gif2rgb.exe	\
	$(CFG)\$(PLAT)\gifbuild.exe	\
	$(CFG)\$(PLAT)\gifecho.exe	\
	$(CFG)\$(PLAT)\giffix.exe	\
#	$(CFG)\$(PLAT)\giftool.exe	\ # Need getopt.h, not available on MSVC
	$(CFG)\$(PLAT)\gifclrmp.exe

!if $(VSVER) >= 14
GIFLIB_UTILS =	\
	$(GIFLIB_UTILS)	\
	$(CFG)\$(PLAT)\gifinto.exe	\
	$(CFG)\$(PLAT)\giftext.exe
!endif
