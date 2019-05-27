/* DO NOT EDIT! GENERATED AUTOMATICALLY! */

#ifndef _MSC_VER
#error This is for MSVC builds only!
#else
# if _MSC_VER < 1600
#  define VSVER "9.0"
# elif _MSC_VER < 1700
#  define VSVER "10.0"
# elif _MSC_VER < 1800
#  define VSVER "11.0"
# elif _MSC_VER < 1900
#  define VSVER "12.0"
# elif _MSC_VER < 1910
#  define VSVER "14.0"
# elif _MSC_VER < 1920
#  define VSVER "15.0"
# elif _MSC_VER < 1930
#  define VSVER "16.0"
# endif
#endif

#ifdef _WIN64
# if defined (_M_AMD64) || (_M_X64)
#  define VSPLAT "x64"
# elif defined (_M_ARM64)
#  define VSPLAT "arm64"
# endif
#else
# define VSPLAT "Win32"
#endif

#define BASEPFX "C:\\" VSVER "\\" VSPLAT

#define PREFIX BASEPFX
#define EXEC_PREFIX BASEPFX
#define BINDIR BASEPFX "/bin"
#define SBINDIR BASEPFX "/sbin"
#define LIBEXECDIR BASEPFX "/libexec"
#define DATAROOTDIR BASEPFX "/share"
#define DATADIR BASEPFX "/share"
#define SYSCONFDIR BASEPFX "/etc"
#define SHAREDSTATEDIR BASEPFX "/com"
#define LOCALSTATEDIR BASEPFX "/var"
#define RUNSTATEDIR BASEPFX "/var/run"
#define INCLUDEDIR BASEPFX "/include"
#define OLDINCLUDEDIR BASEPFX "/../include"
#define DOCDIR BASEPFX "/share/doc/gettext"
#define INFODIR BASEPFX "/share/info"
#define HTMLDIR BASEPFX "/share/doc/gettext"
#define DVIDIR BASEPFX "/share/doc/gettext"
#define PDFDIR BASEPFX "/share/doc/gettext"
#define PSDIR BASEPFX "/share/doc/gettext"
#define LIBDIR BASEPFX "/lib"
#define LISPDIR BASEPFX "/share/emacs/site-lisp"
#define LOCALEDIR BASEPFX "/share/locale"
#define MANDIR BASEPFX "/share/man"
#define PKGDATADIR BASEPFX "/share/gettext"
#define PKGINCLUDEDIR BASEPFX "/include/gettext-tools"
#define PKGLIBDIR BASEPFX "/lib/gettext-tools"
#define PKGLIBEXECDIR BASEPFX "/libexec/gettext-tools"
