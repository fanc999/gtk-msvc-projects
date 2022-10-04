# NMake Makefile portion for enabling features for Windows builds

!include detectenv-msvc.mak

!if "$(PLAT)" == "arm64"
MASM = armasm64
MASM_ARGS = -g -o
MASM_EXTRA_ARGS =
ARCH_FAMILY = aarch64
PLAT_ASM_SRC = ..\src\$(ARCH_FAMILY)\win64_armasm.S
!else
MASM_ARGS = /Zi /Fo
MASM_EXTRA_ARGS = /c
ARCH_FAMILY = x86
!if "$(PLAT)" == "x64"
MASM = ml64
PLAT_ASM_SRC = ..\src\$(ARCH_FAMILY)\win64_intel.S
!else
MASM = ml
PLAT_ASM_SRC = ..\src\$(ARCH_FAMILY)\sysv_intel.S
!endif
!endif

!ifndef UNIX2DOS
UNIX2DOS = unix2dos
!endif

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
ARCH_SRCDIR = ..\src\$(ARCH_FAMILY)
LIBFFI_INCLUDES = /I.\msvc-conf\include /I..\include /I.\msvc-conf
LIBFFI_CFLAGS = $(CFLAGS) /DWIN32 /DUSE_DL_PREFIX /DFFI_BUILDING_DLL
LIBFFI_DLL_SUFFIX = -7

LIBFFI_LIBNAME = ffi.lib
LIBFFI_DLLNAME = ffi$(LIBFFI_DLL_SUFFIX).dll

LIBFFI_LIB = vs$(VSVER)\$(CFG)\$(PLAT)\$(LIBFFI_LIBNAME)
LIBFFI_DLL = vs$(VSVER)\$(CFG)\$(PLAT)\$(LIBFFI_DLLNAME)
