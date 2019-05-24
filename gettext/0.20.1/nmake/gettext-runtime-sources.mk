INTL_RUNTIME_SRCS =	\
	..\gettext-runtime\intl\bindtextdom.c	\
	..\gettext-runtime\intl\dcgettext.c	\
	..\gettext-runtime\intl\dcigettext.c	\
	..\gettext-runtime\intl\dcngettext.c	\
	..\gettext-runtime\intl\dgettext.c	\
	..\gettext-runtime\intl\dngettext.c	\
	..\gettext-runtime\intl\explodename.c	\
	..\gettext-runtime\intl\finddomain.c	\
	..\gettext-runtime\intl\gettext.c	\
	..\gettext-runtime\intl\hash-string.c	\
	..\gettext-runtime\intl\intl-compat.c	\
	..\gettext-runtime\intl\l10nflist.c	\
	..\gettext-runtime\intl\langprefs.c	\
	..\gettext-runtime\intl\loadmsgcat.c	\
	..\gettext-runtime\intl\localcharset.c	\
	..\gettext-runtime\intl\localealias.c	\
	..\gettext-runtime\intl\localename-table.c	\
	..\gettext-runtime\intl\localename.c	\
	..\gettext-runtime\intl\lock.c	\
	..\gettext-runtime\intl\log.c	\
	..\gettext-runtime\intl\ngettext.c	\
	..\gettext-runtime\intl\osdep.c	\
	..\gettext-runtime\intl\plural-exp.c	\
	..\gettext-runtime\intl\plural.c	\
	..\gettext-runtime\intl\printf.c	\
	..\gettext-runtime\intl\relocatable.c	\
	..\gettext-runtime\intl\setlocale.c	\
	..\gettext-runtime\intl\textdomain.c	\
	..\gettext-runtime\intl\threadlib.c	\
	..\gettext-runtime\intl\version.c	\
	..\gettext-runtime\intl\xsize.c

GETTEXT_RUNTIME_BASE_GNULIB_SRCS =	\
	..\gettext-runtime\gnulib-lib\allocator.c	\
	..\gettext-runtime\gnulib-lib\areadlink.c	\
	..\gettext-runtime\gnulib-lib\basename-lgpl.c	\
	..\gettext-runtime\gnulib-lib\basename.c	\
	..\gettext-runtime\gnulib-lib\binary-io.c	\
	..\gettext-runtime\gnulib-lib\c-ctype.c	\
	..\gettext-runtime\gnulib-lib\c-strcasecmp.c	\
	..\gettext-runtime\gnulib-lib\c-strncasecmp.c	\
	..\gettext-runtime\gnulib-lib\canonicalize-lgpl.c	\
	..\gettext-runtime\gnulib-lib\careadlinkat.c	\
	..\gettext-runtime\gnulib-lib\closeout.c	\
	..\gettext-runtime\gnulib-lib\dirname-lgpl.c	\
	..\gettext-runtime\gnulib-lib\error.c	\
	..\gettext-runtime\gnulib-lib\fwriteerror.c	\
	..\gettext-runtime\gnulib-lib\getopt.c	\
	..\gettext-runtime\gnulib-lib\getopt1.c	\
	..\gettext-runtime\gnulib-lib\getprogname.c	\
	..\gettext-runtime\gnulib-lib\hard-locale.c	\
	..\gettext-runtime\gnulib-lib\localcharset.c	\
	..\gettext-runtime\gnulib-lib\localename-table.c	\
	..\gettext-runtime\gnulib-lib\localename.c	\
	..\gettext-runtime\gnulib-lib\malloc.c	\
	..\gettext-runtime\gnulib-lib\malloca.c	\
	..\gettext-runtime\gnulib-lib\mbchar.c	\
	..\gettext-runtime\gnulib-lib\mbiter.c	\
	..\gettext-runtime\gnulib-lib\mbrtowc.c	\
	..\gettext-runtime\gnulib-lib\mbsinit.c	\
	..\gettext-runtime\gnulib-lib\mbslen.c	\
	..\gettext-runtime\gnulib-lib\mbsstr.c	\
	..\gettext-runtime\gnulib-lib\mbuiter.c	\
	..\gettext-runtime\gnulib-lib\msvc-inval.c	\
	..\gettext-runtime\gnulib-lib\msvc-nothrow.c	\
	..\gettext-runtime\gnulib-lib\progname.c	\
	..\gettext-runtime\gnulib-lib\progreloc.c	\
	..\gettext-runtime\gnulib-lib\propername.c	\
	..\gettext-runtime\gnulib-lib\raise.c	\
	..\gettext-runtime\gnulib-lib\readlink.c	\
	..\gettext-runtime\gnulib-lib\relocatable.c	\
	..\gettext-runtime\gnulib-lib\relocwrapper.c	\
	..\gettext-runtime\gnulib-lib\setenv.c	\
	..\gettext-runtime\gnulib-lib\setlocale.c	\
	..\gettext-runtime\gnulib-lib\sigprocmask.c	\
	..\gettext-runtime\gnulib-lib\stat-time.c	\
	..\gettext-runtime\gnulib-lib\stat-w32.c	\
	..\gettext-runtime\gnulib-lib\stat.c	\
	..\gettext-runtime\gnulib-lib\stdio-write.c	\
	..\gettext-runtime\gnulib-lib\strerror-override.c	\
	..\gettext-runtime\gnulib-lib\strerror.c	\
	..\gettext-runtime\gnulib-lib\striconv.c	\
	..\gettext-runtime\gnulib-lib\stripslash.c	\
	..\gettext-runtime\gnulib-lib\strnlen1.c	\
	..\gettext-runtime\gnulib-lib\trim.c	\
	..\gettext-runtime\gnulib-lib\unistd.c	\
	..\gettext-runtime\gnulib-lib\wctype-h.c	\
	..\gettext-runtime\gnulib-lib\wcwidth.c	\
	..\gettext-runtime\gnulib-lib\xmalloc.c	\
	..\gettext-runtime\gnulib-lib\xreadlink.c	\
	..\gettext-runtime\gnulib-lib\xstrdup.c	\
	..\gettext-runtime\gnulib-lib\xstriconv.c

!if $(VSVER) < 12
GETTEXT_RUNTIME_BASE_GNULIB_SRCS =	\
	$(GETTEXT_RUNTIME_BASE_GNULIB_SRCS)	\
	..\gettext-runtime\gnulib-lib\iswblank.c
!endif

LIBCHARSET_SRCS =	\
	..\libcharset\lib\localcharset.c	\
	..\libcharset\lib\relocatable-stub.c

LIBICONV_SRCS =	\
	..\lib\iconv.c	\
	..\lib\relocatable.c

LIBICONV_GNULIB_SRCS =	\
	..\srclib\allocator.c	\
	..\srclib\areadlink.c	\
	..\srclib\basename-lgpl.c	\
	..\srclib\binary-io.c	\
	..\srclib\canonicalize-lgpl.c	\
	..\srclib\careadlinkat.c	\
	..\srclib\c-ctype.c	\
	..\srclib\dirname-lgpl.c	\
	..\srclib\error.c	\
	..\srclib\getprogname.c	\
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
	..\srclib\relocwrapper.c	\
	..\srclib\safe-read.c	\
	..\srclib\setenv.c	\
	..\srclib\sigprocmask.c	\
	..\srclib\stat.c	\
	..\srclib\stat-time.c	\
	..\srclib\stat-w32.c	\
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
