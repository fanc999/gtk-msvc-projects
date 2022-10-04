# NMake Makefile snippet for copying the built libraries, utilities and headers to
# a path under $(PREFIX).

install: all
	@if not exist $(PREFIX)\bin\ md $(PREFIX)\bin
	@if not exist $(PREFIX)\lib\ md $(PREFIX)\lib
	@if not exist $(PREFIX)\include @md $(PREFIX)\include
	@copy /b $(LIBFFI_DLL) $(PREFIX)\bin
	@copy /b $(LIBFFI_DLL:.dll=.pdb) $(PREFIX)\bin
	@copy /b $(LIBFFI_LIB) $(PREFIX)\lib
	@copy .\msvc-conf\include\*.h $(PREFIX)\include
	@for %f in (..\LICENSE ..\README.md ..\doc\libffi.pdf) do copy /b %f $(PREFIX)
	@-for %f in (LICENSE README.md) do $(UNIX2DOS) $(PREFIX)\%f
