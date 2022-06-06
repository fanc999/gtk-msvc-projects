# NMake Makefile snippet for copying the built libraries, utilities and headers to
# a path under $(PREFIX).

install: all
	@if not exist $(PREFIX)\bin\ mkdir $(PREFIX)\bin
	@if not exist $(PREFIX)\lib\ mkdir $(PREFIX)\lib
	@if not exist $(PREFIX)\include\ @mkdir $(PREFIX)\include
	@for %%d in (doc man\man1 man\man3) do @if not exist $(PREFIX)\share\%%d\ md $(PREFIX)\share\%%d
	@for %%f in (charset iconv) do @for %%x in (dll pdb) do @copy vs$(VSVER)\$(CFG)\$(PLAT)\%%f.%%x $(PREFIX)\bin
	@for %%f in (charset iconv) do @for %%x in (lib) do @copy vs$(VSVER)\$(CFG)\$(PLAT)\%%f.%%x $(PREFIX)\lib
	@for %%x in (.exe _exe.pdb) do @copy vs$(VSVER)\$(CFG)\$(PLAT)\iconv%%x $(PREFIX)\bin
	@for %%f in (iconv) do @for %%x in (pdb) do @copy vs$(VSVER)\$(CFG)\$(PLAT)\%%f_exe.%%x $(PREFIX)\bin
	@for %%h in (iconv.h) do @copy ..\msvc\include\%%h.inst $(PREFIX)\include\%%h
	@for %%h in (lib local) do @copy ..\msvc\libcharset\include\%%hcharset.h.inst $(PREFIX)\include\%%hcharset.h
	@copy ..\man\*.html $(PREFIX)\share\doc
	@for %%s in (1 3) do @copy /b ..\man\*.%%s $(PREFIX)\share\man\man%%s
