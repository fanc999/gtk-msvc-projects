# NMake Makefile portion for enabling features for Windows builds

ICU_VER = 58

# Please do not change anything beneath this line unless maintaining the NMake Makefiles

!if "$(CFG)" == "debug"
CFLAGS = $(CFLAGS) /D_DEBUG
!else
CFLAGS = $(CFLAGS) /DNDEBUG
!endif

CXXFLAGS = $(CFLAGS) /EHsc

ICU_BASE_CFLAGS = /wd4244 /wd4307 /wd4308 /D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_WARNINGS
ICU_BASE_INCLUDES = /I..\source\common
ICU_IN_INCLUDES = /I..\source\i18n $(ICU_BASE_INCLUDES)
ICU_IO_INCLUDES = /I..\source\io $(ICU_IN_INCLUDES)
ICU_TU_INCLUDES = /I..\source\i18n $(ICU_IN_INCLUDES)
ICU_TOOL_INCLUDES = /I..\source\tools\toolutil $(ICU_TU_INCLUDES)
ICU_TEST_INCLUDES = /I..\source\tools\ctestfw $(ICU_IO_INCLUDES) $(ICU_TOOL_INCLUDES)

ICU_STUB_DATA_CFLAGS = /DSTUBDATA_BUILD $(ICU_BASE_CFLAGS)
ICU_DEPRECATION_CFLAG = /DU_ATTRIBUTE_DEPRECATED= $(ICU_BASE_CFLAGS)
ICU_UC_CFLAGS = /DU_COMMON_IMPLEMENTATION $(ICU_DEPRECATED_DEFINE) $(ICU_BASE_CFLAGS)
ICU_IN_CFLAGS = /DU_I18N_IMPLEMENTATION $(ICU_DEPRECATED_DEFINE) $(ICU_BASE_CFLAGS)
ICU_IO_CFLAGS = /DU_IO_IMPLEMENTATION $(ICU_BASE_CFLAGS)
ICU_TU_CFLAGS = /DU_TOOLUTIL_IMPLEMENTATION $(ICU_BASE_CFLAGS)
ICU_TEST_CFLAGS = /DT_CTEST_IMPLEMENTATION $(ICU_BASE_CFLAGS)
ICU_DEBUG_SUFFIX =

UCONV_CFLAGS = /DUCONVMSG_LINK $(ICU_BASE_CFLAGS)

!if "$(CFG)" == "debug"
ICU_DEBUG_SUFFIX = d
ICU_UC_CFLAGS = $(ICU_UC_CFLAGS) /DRBBI_DEBUG
!endif

ICU_SYSTEM_LIBS = advapi32.lib

ICU_DLLS =	\
	$(CFG)\$(PLAT)\bin\icudt$(ICU_VER).dll	\
	$(CFG)\$(PLAT)\bin\icuuc$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll	\
	$(CFG)\$(PLAT)\bin\icuin$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll	\
	$(CFG)\$(PLAT)\bin\icuio$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll	\
	$(CFG)\$(PLAT)\bin\icutu$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll	\
	$(CFG)\$(PLAT)\bin\icutest$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll	\
	$(CFG)\$(PLAT)\bin\testplug$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll

ICU_DATA = ..\source\data\out\icudt$(ICU_VER)l.dat

ICU_BUILD_TOOLS =	\
	$(CFG)\$(PLAT)\bin\derb.exe		\
	$(CFG)\$(PLAT)\bin\genbrk.exe	\
	$(CFG)\$(PLAT)\bin\gencfu.exe	\
	$(CFG)\$(PLAT)\bin\genccode.exe	\
	$(CFG)\$(PLAT)\bin\gencmn.exe	\
	$(CFG)\$(PLAT)\bin\gencnval.exe	\
	$(CFG)\$(PLAT)\bin\gendict.exe	\
	$(CFG)\$(PLAT)\bin\gennorm2.exe	\
	$(CFG)\$(PLAT)\bin\gensprep.exe	\
	$(CFG)\$(PLAT)\bin\genrb.exe	\
	$(CFG)\$(PLAT)\bin\gentest.exe	\
	$(CFG)\$(PLAT)\bin\icupkg.exe	\
	$(CFG)\$(PLAT)\bin\makeconv.exe	\
	$(CFG)\$(PLAT)\bin\uconv.exe

ICU_TOOLS =	\
	$(CFG)\$(PLAT)\bin\icuinfo.exe

ICU_SAMPLES =	\
	$(CFG)\$(PLAT)\bin\icu-sample-cal.exe	\
	$(CFG)\$(PLAT)\bin\icu-sample-date.exe

ICU_TESTS =	\
	$(CFG)\$(PLAT)\bin\iotest.exe	\
	$(CFG)\$(PLAT)\bin\intltest.exe	\
	$(CFG)\$(PLAT)\bin\cintltst.exe
