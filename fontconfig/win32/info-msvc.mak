# NMake Makefile portion for displaying config info

XML_IMPL =

!if "$(LIBXML2)" == "1"
XML_IMPL = libxml2
!else
XML_IMPL = expat
!endif

all-build-info:
	@echo.
	@echo ==================================
	@echo Configuration for FontConfig
	@echo ==================================
	@echo XML Implementation: $(XML_IMPL)

help:
	@echo.
	@echo =============================
	@echo Building FontConfig Using NMake
	@echo =============================
	@echo nmake /f Makefile.vc CFG=[release^|debug] ^<PREFIX=PATH^> ^<PYTHON=PATH^> OPTION=1 ...
	@echo.
	@echo Where:
	@echo ------
	@echo CFG: Required, use CFG=release for an optimized build and CFG=debug
	@echo for a debug build.  PDB files are generated for all builds.
	@echo.
	@echo PREFIX: Optional, the path where dependent libraries and tools may be
	@echo found, default is ^$(srcrootdir)\..\vs^$(short_vs_ver)\^$(platform),
	@echo where ^$(short_vs_ver) is 9 for VS 2008, 10 for VS 2010 and so on; and
	@echo ^$(platform) is Win32 for 32-bit builds and x64 for x64 builds.
	@echo.
	@echo PYTHON:
	@echo Use if the Python interpretor is not in your PATH, to specifiy path
	@echo to the Python interpretor.  Required to generate fcblanks.h which is
	@echo needed for the build process--you will need to install lxml and six
	@echo Python modules installed.
	@echo.
	@echo OPTION: Optional, may be any of the following, use OPTION=1 to enable;
	@echo multiple OPTION's may be used.  If no OPTION is specified, a default
	@echo HarfBuzz DLL is built with expat XML support.
	@echo ======
	@echo.
	@echo LIBXML2:
	@echo Use libxml2 instead of libexpat to handle XML.
	@echo.
	@echo ======
	@echo A 'clean' target is supported to remove all generated files, intermediate
	@echo object files and binaries for the specified configuration.
	@echo.
	@echo An 'install' target is supported to copy the build (DLLs, utility programs,
	@echo LIBs, along with the introspection files if applicable) to appropriate
	@echo locations under ^$(PREFIX).
	@echo ======
	@echo.
	
