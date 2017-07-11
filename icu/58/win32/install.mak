# NMake Makefile snippet for copying the built libraries, utilities and headers to
# a path under $(PREFIX).

install: all
	@if not exist $(PREFIX)\bin\NUL mkdir $(PREFIX)\bin
	@if not exist $(PREFIX)\lib\NUL mkdir $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\icudt$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icudt$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icuuc$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icuuc$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icuin$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icuin$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icuio$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icuio$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icutu$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icutu$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icudt$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\icuuc$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\icuin$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\icuio$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\icutu$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\icu-sample-*.exe $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icu-sample-*.pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icuinfo.exe $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\icuinfo.pdb $(PREFIX)\bin
	
	@if not exist $(PREFIX)\include\unicode\NUL mkdir $(PREFIX)\include\unicode
	@copy ..\source\common\unicode\*.h $(PREFIX)\include\unicode
	@copy ..\source\i18n\unicode\*.h $(PREFIX)\include\unicode
	@copy ..\source\io\unicode\*.h $(PREFIX)\include\unicode
