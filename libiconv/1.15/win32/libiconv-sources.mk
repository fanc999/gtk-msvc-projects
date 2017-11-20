LIBCHARSET_SRCS =	\
	..\libcharset\lib\localcharset.c	\
	..\libcharset\lib\relocatable.c

LIBICONV_SRCS =	\
	..\lib\iconv.c	\
	..\lib\relocatable.c

LIBICONV_GNULIB_SRCS =	\
	..\srclib\allocator.c	\
	..\srclib\areadlink.c	\
	..\srclib\basename-lgpl.c	\
	..\srclib\binary-io.c	\
	..\srclib\c-ctype.c	\
	..\srclib\canonicalize-lgpl.c	\
	..\srclib\careadlinkat.c	\
	..\srclib\dirname-lgpl.c	\
	..\srclib\error.c	\
	..\srclib\getprogname.c	\
	..\srclib\gettimeofday.c	\
	..\srclib\lstat.c	\
	..\srclib\malloc.c	\
	..\srclib\malloca.c	\
	..\srclib\msvc-inval.c	\
	..\srclib\msvc-nothrow.c	\
	..\srclib\progname.c	\
	..\srclib\progreloc.c	\
	..\srclib\raise.c	\
	..\srclib\read.c	\
	..\srclib\readlink.c	\
	..\srclib\relocatable.c	\
	..\srclib\safe-read.c	\
	..\srclib\setenv.c	\
	..\srclib\sigprocmask.c	\
	..\srclib\stat.c	\
	..\srclib\stdio-write.c	\
	..\srclib\strerror-override.c	\
	..\srclib\strerror.c	\
	..\srclib\stripslash.c	\
	..\srclib\unistd.c	\
	..\srclib\uniwidth\width.c	\
	..\srclib\xmalloc.c	\
	..\srclib\xreadlink.c	\
	..\srclib\xstrdup.c

!ifdef USE_I18N
ICONV_SRCS = ..\src\iconv.c
!else
ICONV_SRCS = ..\src\iconv_no_i18n.c
!endif