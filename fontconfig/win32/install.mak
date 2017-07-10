# NMake Makefile snippet for copying the built libraries, utilities and headers to
# a path under $(PREFIX).

!if "$(LIBXML2)" == "1"
LIBXML2_PC_FLAG = --libxml2
!else
LIBXML2_PC_FLAG =
!endif

install: all
	@if not exist $(PREFIX)\bin\NUL mkdir $(PREFIX)\bin
	@if not exist $(PREFIX)\lib\NUL mkdir $(PREFIX)\lib
	@if not exist $(PREFIX)\include\fontconfig\NUL mkdir $(PREFIX)\include\fontconfig
	@copy /b $(CFG)\$(PLAT)\fontconfig.dll $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\fontconfig.pdb $(PREFIX)\bin
	@copy /b $(CFG)\$(PLAT)\fontconfig.lib $(PREFIX)\lib
	
	@for %b in (cache cat list match pattern query scan validate)	\
	do @(copy /b $(CFG)\$(PLAT)\fc-%b.exe $(PREFIX)\bin) & \
	@(copy /b $(CFG)\$(PLAT)\fc-%b.pdb $(PREFIX)\bin)
	
	@if not exist $(PREFIX)\share\xml\fontconfig mkdir $(PREFIX)\share\xml\fontconfig
	@copy ..\fonts.dtd $(PREFIX)\share\xml\fontconfig
	@if not exist $(PREFIX)\bin\fonts\conf.d\NUL mkdir $(PREFIX)\bin\fonts\conf.d
	@copy ..\conf.d\*.conf $(PREFIX)\bin\fonts\conf.d\ 
	@$(PYTHON) gen-fc-conf.py --version=2.12.4 --prefix=$(PREFIX)
	@if not exist $(PREFIX)\lib\pkgconfig\NUL mkdir $(PREFIX)\lib\pkgconfig
	@$(PYTHON) fcpc.py --version=2.12.4 --prefix=$(PREFIX) $(LIBXML2_PC_FLAG)
