/* lib/config.h.  Generated from config.h.in by configure.  */
/* Copyright (C) 1999-2003, 2005, 2007, 2010, 2012 Free Software Foundation, Inc.
   This file is part of the GNU LIBICONV Library.

   The GNU LIBICONV Library is free software; you can redistribute it
   and/or modify it under the terms of the GNU Library General Public
   License as published by the Free Software Foundation; either version 2
   of the License, or (at your option) any later version.

   The GNU LIBICONV Library is distributed in the hope that it will be
   useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with the GNU LIBICONV Library; see the file COPYING.LIB.
   If not, see <https://www.gnu.org/licenses/>.  */

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

/* Define to 1 to enable a few rarely used encodings. */
/* #undef ENABLE_EXTRA */

/* Define to 1 if the package shall run at any location in the filesystem. */
#define ENABLE_RELOCATABLE 1

/* Define to a type if <wchar.h> does not define. */
/* #undef mbstate_t */

/* Define if you have <iconv.h>, the iconv_t type, and the
   iconv_open, iconv, iconv_close functions. */
/* #undef HAVE_ICONV */
/* Define as const if the declaration of iconv() needs const. */
#define ICONV_CONST 

/* Define to 1 if you have the getc_unlocked() function. */
/* #undef HAVE_GETC_UNLOCKED */

/* Define if you have <langinfo.h> and nl_langinfo(CODESET). */
/* #undef HAVE_LANGINFO_CODESET */

/* Define if you have the mbrtowc() function. */
#define HAVE_MBRTOWC 1

/* Define to 1 if you have the setlocale() function. */
#define HAVE_SETLOCALE 1

/* Define to 1 if you have the <stddef.h> header file. */
/* #undef HAVE_STDDEF_H */

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 or 0, depending whether the compiler supports simple visibility
   declarations. */
#define HAVE_VISIBILITY 0

/* Define if you have the wcrtomb() function. */
#define HAVE_WCRTOMB 1

/* Define to 1 if O_NOFOLLOW works. */
#define HAVE_WORKING_O_NOFOLLOW 0

/* Define if the machine's byte ordering is little endian. */
#define WORDS_LITTLEENDIAN 1

/* Define to the value of ${prefix}, as a string. */
#define INSTALLPREFIX BASEPFX

/* Define to '__inline__' or '__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to 'int' if <sys/types.h> does not define. */
#define mode_t int

/* Define as a signed type of the same size as size_t. */
#define ssize_t int

