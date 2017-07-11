# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Generate marker stub file when stub icudt.dll is built.
..\source\stubdata\stubdatabuilt.txt:
	@echo File with stubdata build time, used as a dependency to trigger fresh data build, since stubdata dll will overwrite the real one. > $@

# Generate the .res files from fr.txt and root.txt
..\source\extra\uconv\resources\root.res: $(CFG)\$(PLAT)\genrb.exe ..\source\extra\uconv\resources\root.txt
	$(CFG)\$(PLAT)\genrb.exe -s $(@D) -d $(@D) $(@B).txt

..\source\extra\uconv\resources\fr.res: $(CFG)\$(PLAT)\genrb.exe ..\source\extra\uconv\resources\fr.txt
	$(CFG)\$(PLAT)\genrb.exe -s $(@D) -d $(@D) $(@B).txt

# Generate uconvmsg.lib
$(CFG)\$(PLAT)\uconvmsg.lib: ..\source\extra\uconv\resources\root.res ..\source\extra\uconv\resources\fr.res $(CFG)\$(PLAT)\pkgdata.exe
	@dir /b ..\source\extra\uconv\resources\*.res > ..\source\extra\uconv\pkgdatain.txt
	$(CFG)\$(PLAT)\pkgdata.exe -f -v -m static -c -p uconvmsg -d $(@D) -s ..\source\extra\uconv\resources\ ..\source\extra\uconv\pkgdatain.txt

$(ICU_DATA):	\
$(CFG)\$(PLAT)\genbrk.exe	\
$(CFG)\$(PLAT)\genccode.exe	\
$(CFG)\$(PLAT)\gencfu.exe	\
$(CFG)\$(PLAT)\gencmn.exe	\
$(CFG)\$(PLAT)\gencnval.exe	\
$(CFG)\$(PLAT)\gendict.exe	\
$(CFG)\$(PLAT)\gennorm2.exe	\
$(CFG)\$(PLAT)\genrb.exe	\
$(CFG)\$(PLAT)\gensprep.exe	\
$(CFG)\$(PLAT)\gentest.exe	\
$(CFG)\$(PLAT)\makeconv.exe	\
$(CFG)\$(PLAT)\icupkg.exe	\
$(CFG)\$(PLAT)\pkgdata.exe	\
$(CFG)\$(PLAT)\uconv.exe
	$(MAKE) /f ..\source\data\makedata.mak ICUMAKE=%CD%\..\source\data\ PROJECTDIR=%CD% CFG=$(CFG) PLAT=$(PLAT)

# Create the build directories
$(CFG)\$(PLAT)\stubdata	\
$(CFG)\$(PLAT)\common	\
$(CFG)\$(PLAT)\i18n		\
$(CFG)\$(PLAT)\io		\
$(CFG)\$(PLAT)\icutu	\
$(CFG)\$(PLAT)\icutest	\
$(CFG)\$(PLAT)\testplug	\
$(CFG)\$(PLAT)\tools	\
$(CFG)\$(PLAT)\samples_cal	\
$(CFG)\$(PLAT)\samples_date	\
$(CFG)\$(PLAT)\intltest	\
$(CFG)\$(PLAT)\cintltst	\
$(CFG)\$(PLAT)\iotest:
	@-md $@
