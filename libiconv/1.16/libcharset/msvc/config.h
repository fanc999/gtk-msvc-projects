/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */

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
# if defined (_M_AMD64) || defined (_M_X64)
#  define VSPLAT "x64"
# elif defined (_M_ARM64)
#  define VSPLAT "arm64"
# endif
#else
# define VSPLAT "Win32"
#endif

#define BASEPFX "C:\\" VSVER "\\" VSPLAT

/* Define to 1 if the package shall run at any location in the file system. */
#define ENABLE_RELOCATABLE 1

/* Define to 1 if you have the `copy_file_range' function. */
/* #undef HAVE_COPY_FILE_RANGE */

/* Define to 1 if you have the <dlfcn.h> header file. */
/* #undef HAVE_DLFCN_H */

/* Define to 1 if you have the <inttypes.h> header file. */
#if _MSC_VER >= 1800
# define HAVE_INTTYPES_H 1
#endif

/* Define if you have <langinfo.h> and nl_langinfo(CODESET). */
/* #undef HAVE_LANGINFO_CODESET */

/* Define to 1 if you have the <mach-o/dyld.h> header file. */
/* #undef HAVE_MACH_O_DYLD_H */

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the `setlocale' function. */
#define HAVE_SETLOCALE 1

/* Define to 1 if you have the <stdint.h> header file. */
#if _MSC_VER >= 1600
# define HAVE_STDINT_H 1
#endif

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
/* #undef HAVE_STRINGS_H */

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `symlink' function. */
/* #undef HAVE_SYMLINK */

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
/* #undef HAVE_UNISTD_H */

/* Define to 1 or 0, depending whether the compiler supports simple visibility
   declarations. */
#define HAVE_VISIBILITY 0

/* Define to 1 if O_NOATIME works. */
#define HAVE_WORKING_O_NOATIME 0

/* Define to 1 if O_NOFOLLOW works. */
#define HAVE_WORKING_O_NOFOLLOW 0

/* Define to 1 if you have the `_NSGetExecutablePath' function. */
/* #undef HAVE__NSGETEXECUTABLEPATH */

/* Define to the value of ${prefix}, as a string. */
#define INSTALLPREFIX BASEPFX

/* Define to the sub-directory where libtool stores uninstalled libraries. */
#define LT_OBJDIR ".libs/"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT ""

/* Define to the full name of this package. */
#define PACKAGE_NAME "libcharset"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "libcharset 1.4"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "libcharset"

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION "1.4"

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Enable extensions on AIX 3, Interix.  */
#ifndef _ALL_SOURCE
# define _ALL_SOURCE 1
#endif
/* Enable GNU extensions on systems that have them.  */
#ifndef _GNU_SOURCE
# define _GNU_SOURCE 1
#endif
/* Enable threading extensions on Solaris.  */
#ifndef _POSIX_PTHREAD_SEMANTICS
# define _POSIX_PTHREAD_SEMANTICS 1
#endif
/* Enable extensions on HP NonStop.  */
#ifndef _TANDEM_SOURCE
# define _TANDEM_SOURCE 1
#endif
/* Enable general extensions on Solaris.  */
#ifndef __EXTENSIONS__
# define __EXTENSIONS__ 1
#endif


/* Define to 1 if on MINIX. */
/* #undef _MINIX */

/* Define to 2 if the system does not provide POSIX.1 features except with
   this defined. */
/* #undef _POSIX_1_SOURCE */

/* Define to 1 if you need to in order for `stat' and other things to work. */
/* #undef _POSIX_SOURCE */
