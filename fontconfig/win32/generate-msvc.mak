# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Copy the pre-defined config.h.win32
config.h: config.h.win32
	@-copy $@.win32 $@

$(CFG)\$(PLAT)\fontconfig\fcalias.h	$(CFG)\$(PLAT)\fontconfig\fcaliastail.h $(CFG)\$(PLAT)\fontconfig\fcftalias.h $(CFG)\$(PLAT)\fontconfig\fcftaliastail.h: $(CFG)\$(PLAT)\fontconfig
	@echo /* This is a stub for Visual Studio builds */ >$@

$(CFG)\$(PLAT)\fontconfig\fcblanks.h: $(CFG)\$(PLAT)\fontconfig ..\fc-blanks\fc-blanks.py ..\fc-blanks\fcblanks.tmpl.h
	$(PYTHON) ..\fc-blanks\fc-blanks.py < ..\fc-blanks\fcblanks.tmpl.h > $@

$(CFG)\$(PLAT)\fontconfig\fccase.h: $(CFG)\$(PLAT)\buildtools $(CFG)\$(PLAT)\fontconfig $(CFG)\$(PLAT)\fc-case.exe ..\fc-case\CaseFolding.txt ..\fc-case\fccase.tmpl.h
	$(CFG)\$(PLAT)\fc-case.exe ..\fc-case\CaseFolding.txt < ..\fc-case\fccase.tmpl.h > $@

$(CFG)\$(PLAT)\fontconfig\fcglyphname.h: $(CFG)\$(PLAT)\buildtools $(CFG)\$(PLAT)\fontconfig $(CFG)\$(PLAT)\fc-glyphname.exe ..\fc-glyphname\zapfdingbats.txt ..\fc-glyphname\fcglyphname.tmpl.h
	$(CFG)\$(PLAT)\fc-glyphname.exe ..\fc-glyphname\zapfdingbats.txt < ..\fc-glyphname\fcglyphname.tmpl.h > $@

$(CFG)\$(PLAT)\fontconfig\fclang.h: $(CFG)\$(PLAT)\buildtools $(CFG)\$(PLAT)\fontconfig $(CFG)\$(PLAT)\fc-lang.exe $(FC_LANG_ORTH) ..\fc-lang\fclang.tmpl.h
	$(CFG)\$(PLAT)\fc-lang.exe -d ..\fc-lang $(FC_LANG_ORTH) < ..\fc-lang\fclang.tmpl.h > $@

# Create the build directories
$(CFG)\$(PLAT)\buildtools $(CFG)\$(PLAT)\fontconfig $(CFG)\$(PLAT)\util:
	@-md $@
