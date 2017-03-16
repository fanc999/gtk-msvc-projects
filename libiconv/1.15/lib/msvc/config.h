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
   If not, see <http://www.gnu.org/licenses/>.  */

#ifdef _WIN64
# define PLAT "x64"
# define _GL_SIZE_T_BITS 64
#else
# define PLAT "Win32"
# define _GL_SIZE_T_BITS 32
#endif

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
#if _MSC_VER < 1600
#define INSTALLPREFIX "c:/vs9.0/" PLAT
#elif _MSC_VER < 1700
#define INSTALLPREFIX "c:/vs10.0/" PLAT
#elif _MSC_VER < 1800
#define INSTALLPREFIX "c:/vs11.0/" PLAT
#elif _MSC_VER < 1900
#define INSTALLPREFIX "c:/vs12.0/" PLAT
#elif _MSC_VER < 1910
#define INSTALLPREFIX "c:/vs14.0/" PLAT
#elif _MSC_VER < 2000
#define INSTALLPREFIX "c:/vs15.0/" PLAT
#endif

/* Define to '__inline__' or '__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to 'int' if <sys/types.h> does not define. */
#define mode_t int

/* Define as a signed type of the same size as size_t. */
#ifdef _WIN64
#define ssize_t __int64
#else
#define ssize_t int
#endif
