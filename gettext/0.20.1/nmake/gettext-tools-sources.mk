GETTEXT_LIB_BASE_SRCS =	\
	acl-errno-valid.c	\
	acl-internal.c	\
	addext.c	\
	allocator.c	\
	areadlink.c	\
	argmatch.c	\
	asnprintf.c	\
	asprintf.c	\
	backupfile.c	\
	basename-lgpl.c	\
	basename.c	\
	binary-io.c	\
	c-ctype.c	\
	c-strcasecmp.c	\
	c-strcasestr.c	\
	c-strncasecmp.c	\
	c-strstr.c	\
	canonicalize-lgpl.c	\
	careadlinkat.c	\
	classpath.c	\
	clean-temp.c	\
	cloexec.c	\
	close.c	\
	closedir.c	\
	closeout.c	\
	concat-filename.c	\
	copy-acl.c	\
	copy-file.c	\
	csharpcomp.c	\
	csharpexec.c	\
	dirfd.c	\
	dirname-lgpl.c	\
	dup-safer-flag.c	\
	dup-safer.c	\
	dup2.c	\
	error-progname.c	\
	error.c	\
	execute.c	\
	exitfail.c	\
	fatal-signal.c	\
	fcntl.c	\
	fd-hook.c	\
	fd-safer-flag.c	\
	fd-safer.c	\
	findprog.c	\
	fnmatch.c	\
	fopen.c	\
	fstat.c	\
	fstrcmp.c	\
	ftell.c	\
	ftello.c	\
	full-write.c	\
	fwriteerror.c	\
	gcd.c	\
	get-permissions.c	\
	getdelim.c	\
	getdtablesize.c	\
	getline.c	\
	getopt.c	\
	getopt1.c	\
	getprogname.c	\
	gettime.c	\
	gettimeofday.c	\
	gl_linkedhash_list.c	\
	gl_list.c	\
	gl_xlist.c	\
	hard-locale.c	\
	hash.c	\
	isinf.c	\
	isnand.c	\
	isnanf.c	\
	isnanl.c	\
	javacomp.c	\
	javaexec.c	\
	javaversion.c	\
	localcharset.c	\
	localename-table.c	\
	localename.c	\
	localtime-buffer.c	\
	localtime.c	\
	lseek.c	\
	malloc.c	\
	malloca.c	\
	math.c	\
	mbchar.c	\
	mbiter.c	\
	mbrtowc.c	\
	mbsinit.c	\
	mbslen.c	\
	mbsrtowcs-state.c	\
	mbsrtowcs.c	\
	mbsstr.c	\
	mbswidth.c	\
	mbuiter.c	\
	mkdir.c	\
	mkdtemp.c	\
	msvc-inval.c	\
	msvc-nothrow.c	\
	obstack.c	\
	omp-init.c	\
	open.c	\
	opendir.c	\
	pipe-filter-aux.c	\
	pipe-filter-ii.c	\
	pipe-safer.c	\
	pipe2-safer.c	\
	pipe2.c	\
	printf-args.c	\
	printf-parse.c	\
	progname.c	\
	progreloc.c	\
	propername.c	\
	qcopy-acl.c	\
	qset-acl.c	\
	quotearg.c	\
	raise.c	\
	rawmemchr.c	\
	read-file.c	\
	read.c	\
	readdir.c	\
	readlink.c	\
	realloc.c	\
	relocatable.c	\
	relocwrapper.c	\
	rmdir.c	\
	safe-read.c	\
	safe-write.c	\
	secure_getenv.c	\
	set-acl.c	\
	set-permissions.c	\
	setenv.c	\
	setlocale.c	\
	sh-quote.c	\
	sig-handler.c	\
	sigaction.c	\
	sigprocmask.c	\
	snprintf.c	\
	spawn-pipe.c	\
	spawnattr_destroy.c	\
	spawnattr_init.c	\
	spawnattr_setflags.c	\
	spawnattr_setsigmask.c	\
	spawni.c	\
	spawnp.c	\
	spawn_faction_addclose.c	\
	spawn_faction_adddup2.c	\
	spawn_faction_addopen.c	\
	spawn_faction_destroy.c	\
	spawn_faction_init.c	\
	stat-time.c	\
	stat-w32.c	\
	stat.c	\
	stdio-write.c	\
	stpcpy.c	\
	stpncpy.c	\
	strchrnul.c	\
	strerror-override.c	\
	strerror.c	\
	striconv.c	\
	striconveh.c	\
	striconveha.c	\
	stripslash.c	\
	strnlen1.c	\
	strstr.c	\
	tempname.c	\
	timespec.c	\
	tmpdir.c	\
	trim.c	\
	unistd.c	\
	unsetenv.c	\
	utime.c	\
	utimens.c	\
	vasnprintf.c	\
	vasprintf.c	\
	vsnprintf.c	\
	wait-process.c	\
	waitpid.c	\
	wctype-h.c	\
	wcwidth.c	\
	write.c	\
	xasprintf.c	\
	xconcat-filename.c	\
	xerror.c	\
	xmalloc.c	\
	xmalloca.c	\
	xmemdup0.c	\
	xreadlink.c	\
	xsetenv.c	\
	xsize.c	\
	xstrdup.c	\
	xstriconv.c	\
	xstriconveh.c	\
	xvasprintf.c	\

!if $(VSVER) < 12
GETTEXT_LIB_BASE_SRCS =	\
	$(GETTEXT_LIB_BASE_SRCS)	\
	iswblank.c	\
	signbitd.c	\
	signbitf.c	\
	signbitl.c
!endif

LIBGREP_SOURCES =	\
	kwset.c	\
	localeconv.c	\
	m-fgrep.c	\
	m-regex.c	\
	mbrlen.c	\
	nl_langinfo.c	\
	regex.c	\
	wcrtomb.c

LIBGETTEXTPO_GNULIB_SRCS =	\
	asnprintf.c	\
	asprintf.c	\
	basename-lgpl.c	\
	basename.c	\
	c-ctype.c	\
	c-strcasecmp.c	\
	c-strncasecmp.c	\
	c-strstr.c	\
	cloexec.c	\
	close.c	\
	concat-filename.c	\
	dirname-lgpl.c	\
	dup2.c	\
	error-progname.c	\
	error.c	\
	exitfail.c	\
	fcntl.c	\
	fd-hook.c	\
	float.c	\
	fopen.c	\
	fstat.c	\
	fstrcmp.c	\
	fsync.c	\
	fwriteerror.c	\
	gcd.c	\
	getdelim.c	\
	getdtablesize.c	\
	getline.c	\
	getprogname.c	\
	gl_linked_list.c	\
	gl_list.c	\
	gl_xlist.c	\
	hard-locale.c	\
	hash.c	\
	localcharset.c	\
	malloc.c	\
	malloca.c	\
	markup.c	\
	mbrtowc.c	\
	mbsinit.c	\
	mbswidth.c	\
	msvc-inval.c	\
	msvc-nothrow.c	\
	obstack.c	\
	open.c	\
	printf-args.c	\
	printf-parse.c	\
	raise.c	\
	rawmemchr.c	\
	realloc.c	\
	relocatable.c	\
	sigprocmask.c	\
	stat-time.c	\
	stat-w32.c	\
	stat.c	\
	stdio-write.c	\
	stpcpy.c	\
	stpncpy.c	\
	strchrnul.c	\
	strerror-override.c	\
	strerror.c	\
	striconv.c	\
	striconveh.c	\
	striconveha.c	\
	stripslash.c	\
	strstr.c	\
	unistd.c	\
	vasnprintf.c	\
	vasprintf.c	\
	wctype-h.c	\
	wcwidth.c	\
	xasprintf.c	\
	xconcat-filename.c	\
	xerror.c	\
	xmalloc.c	\
	xmalloca.c	\
	xsize.c	\
	xstrdup.c	\
	xstriconv.c	\
	xvasprintf.c

FORMAT_SOURCES =	\
	format-c.c \
	format-sh.c \
	format-python.c \
	format-python-brace.c \
	format-lisp.c \
	format-elisp.c \
	format-librep.c \
	format-scheme.c \
	format-java.c \
	format-javascript.c \
	format-csharp.c \
	format-awk.c \
	format-pascal.c \
	format-ycp.c \
	format-tcl.c \
	format-perl.c \
	format-perl-brace.c \
	format-php.c \
	format-gcc-internal.c \
	format-gfc-internal.c \
	format-qt.c \
	format-qt-plural.c \
	format-kde.c \
	format-kde-kuit.c \
	format-boost.c \
	format-lua.c \
	..\gettext-tools\woe32dll\c++format.cc

LIBGETTEXTPO_LIBGETTEXTSRC_COMMON_SRCS =	\
	dir-list.c \
	message.c \
	msgl-ascii.c \
	msgl-check.c \
	open-catalog.c \
	plural-exp.c \
	plural-eval.c \
	plural-table.c \
	po-error.c \
	po-charset.c \
	po-gram-gen.c \
	po-lex.c \
	po-xerror.c \
	read-catalog.c \
	read-catalog-abstract.c \
	read-po.c \
	sentence.c	\
	str-list.c	\
	write-catalog.c \
	write-po.c

LIBGETTEXTPO_AUX_SRCS =	\
	$(LIBGETTEXTPO_LIBGETTEXTSRC_COMMON_SRCS)	\
	$(FORMAT_SOURCES)

LIBGETTEXTSRC_SRCS =	\
	$(LIBGETTEXTPO_AUX_SRCS)	\
	file-list.c	\
	its.c	\
	locating-rule.c	\
	msgl-cat.c	\
	msgl-charset.c	\
	msgl-english.c	\
	msgl-equal.c	\
	msgl-header.c	\
	msgl-iconv.c	\
	po-time.c	\
	read-desktop.c	\
	read-properties.c	\
	read-stringtable.c	\
	search-path.c	\
	write-properties.c	\
	write-stringtable.c

MSGATTRIB_SOURCES = msgattrib.c
MSGCAT_SOURCES = msgcat.c

MSGCMP_SOURCES =	\
	msgcmp.c	\
	msgl-fsearch.c

MSGCOMM_SOURCES = msgcomm.c
MSGCONV_SOURCES = msgconv.c
MSGEN_SOURCES = msgen.c
MSGEXEC_SOURCES = msgexec.c

MSGFILTER_SOURCES =	\
	msgfilter.c	\
	filter-sr-latin.c	\
	filter-quote.c

MSGFMT_SOURCES =	\
	msgfmt.c	\
	write-mo.c	\
	write-java.c	\
	write-csharp.c	\
	write-resources.c	\
	write-tcl.c	\
	write-qt.c	\
	write-desktop.c	\
	write-xml.c	\
	..\gettext-runtime\intl\hash-string.c

MSGGREP_SOURCES = msggrep.c

MSGMERGE_SOURCES =	\
	msgmerge.c	\
	msgl-fsearch.c	\
	lang-table.c	\
	plural-count.c

MSGUNFMT_SOURCES =	\
	msgunfmt.c	\
	read-csharp.c	\
	read-java.c	\
	read-mo.c	\
	read-resources.c	\
	read-tcl.c

MSGUNIQ_SOURCES = msguniq.c

RECODE_SR_LATIN_SOURCES =	\
	filter-sr-latin.c	\
	recode-sr-latin.c

XGETTEXT_SOURCES =	\
	..\gettext-tools\woe32dll\c++xgettext.cc	\
	xg-arglist-callshape.c	\
	xg-arglist-context.c	\
	xg-arglist-parser.c	\
	xg-encoding.c	\
	xg-pos.c	\
	xg-message.c	\
	xg-mixed-string.c	\
	x-java.c	\
	x-csharp.c	\
	x-awk.c	\
	x-c.c	\
	x-desktop.c	\
	x-elisp.c	\
	x-javascript.c	\
	x-librep.c	\
	x-lisp.c	\
	x-lua.c	\
	x-perl.c	\
	x-php.c	\
	x-po.c	\
	x-python.c	\
	x-rst.c	\
	x-scheme.c	\
	x-sh.c	\
	x-smalltalk.c	\
	x-tcl.c	\
	x-vala.c	\
	x-ycp.c


GETTEXT_TOOLS_TOOLS =	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgattrib.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgcat.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgcmp.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgcomm.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgconv.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgen.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgexec.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgfilter.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgfmt.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msggrep.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgmerge.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msgunfmt.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\msguniq.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\recode-sr-latin.exe	\
	vs$(VSVER)\$(CFG)\$(PLAT)\xgettext.exe
