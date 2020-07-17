# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Generate marker stub file when stub icudt.dll is built.
..\source\stubdata\stubdatabuilt.txt:
	@echo File with stubdata build time, used as a dependency to trigger fresh data build, since stubdata dll will overwrite the real one. > $@

# Generate the .res files from fr.txt and root.txt
..\source\extra\uconv\resources\root.res: $(CFG)\$(PLAT)\bin\genrb.exe ..\source\extra\uconv\resources\root.txt
	$(CFG)\$(PLAT)\bin\genrb.exe -s $(@D) -d $(@D) $(@B).txt

..\source\extra\uconv\resources\fr.res: $(CFG)\$(PLAT)\bin\genrb.exe ..\source\extra\uconv\resources\fr.txt
	$(CFG)\$(PLAT)\bin\genrb.exe -s $(@D) -d $(@D) $(@B).txt

# Generate uconvmsg.lib
$(CFG)\$(PLAT)\bin\uconvmsg.lib: ..\source\extra\uconv\resources\root.res ..\source\extra\uconv\resources\fr.res $(CFG)\$(PLAT)\bin\pkgdata.exe
	@dir /b ..\source\extra\uconv\resources\*.res > ..\source\extra\uconv\pkgdatain.txt
	$(CFG)\$(PLAT)\bin\pkgdata.exe -f -v -m static -c -p uconvmsg -d $(@D) -s ..\source\extra\uconv\resources\ ..\source\extra\uconv\pkgdatain.txt

$(ICU_DATA):	\
$(CFG)\$(PLAT)\bin\genbrk.exe	\
$(CFG)\$(PLAT)\bin\genccode.exe	\
$(CFG)\$(PLAT)\bin\gencfu.exe	\
$(CFG)\$(PLAT)\bin\gencmn.exe	\
$(CFG)\$(PLAT)\bin\gencnval.exe	\
$(CFG)\$(PLAT)\bin\gendict.exe	\
$(CFG)\$(PLAT)\bin\gennorm2.exe	\
$(CFG)\$(PLAT)\bin\genrb.exe	\
$(CFG)\$(PLAT)\bin\gensprep.exe	\
$(CFG)\$(PLAT)\bin\gentest.exe	\
$(CFG)\$(PLAT)\bin\makeconv.exe	\
$(CFG)\$(PLAT)\bin\icupkg.exe	\
$(CFG)\$(PLAT)\bin\pkgdata.exe	\
$(CFG)\$(PLAT)\bin\uconv.exe
	$(MAKE) /f ..\source\data\makedata.mak ICUMAKE=%CD%\..\source\data\ PROJECTDIR=%CD% CFG=$(CFG_CAP) PLAT=$(PLAT)
