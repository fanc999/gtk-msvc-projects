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
