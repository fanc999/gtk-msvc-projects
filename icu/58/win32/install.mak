# NMake Makefile snippet for copying the built libraries, utilities and headers to
# a path under $(PREFIX).

install: all
	@if not exist $(PREFIX)\bin\NUL mkdir $(PREFIX)\bin
	@if not exist $(PREFIX)\lib\NUL mkdir $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\bin\icudt$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icudt$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icuuc$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icuuc$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icuin$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icuin$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icuio$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icuio$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icutu$(ICU_VER)$(ICU_DEBUG_SUFFIX).dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icutu$(ICU_VER)$(ICU_DEBUG_SUFFIX).pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icudt$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\bin\icuuc$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\bin\icuin$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\bin\icuio$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\bin\icutu$(ICU_DEBUG_SUFFIX).lib $(PREFIX)\lib
	@copy /b $(CFG)\$(PLAT)\bin\icu-sample-*.exe $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icu-sample-*.pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icuinfo.exe $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\bin\icuinfo.pdb $(PREFIX)\bin
	
	@if not exist $(PREFIX)\include\unicode\NUL mkdir $(PREFIX)\include\unicode
	@copy ..\source\common\unicode\*.h $(PREFIX)\include\unicode
	@copy ..\source\i18n\unicode\*.h $(PREFIX)\include\unicode
	@copy ..\source\io\unicode\*.h $(PREFIX)\include\unicode
