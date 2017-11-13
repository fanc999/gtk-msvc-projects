

ZLIB_BASE_SRCS =	\
	..\adler32.c	\
	..\compress.c	\
	..\crc32.c	\
	..\deflate.c	\
	..\gzclose.c	\
	..\gzlib.c	\
	..\gzread.c	\
	..\gzwrite.c	\
	..\infback.c	\
	..\inflate.c	\
	..\inftrees.c	\
	..\inffast.c	\
	..\trees.c	\
	..\uncompr.c	\
	..\zutil.c

ZLIB_X64_ASM_SRCS =	\
	..\contrib\masmx64\inffasx64.asm	\
	..\contrib\masmx64\gvmat64.asm	\
	..\contrib\masmx64\inffas8664.c

ZLIB_X86_ASM_SRCS =	\
	..\contrib\masmx86\inffas32.asm	\
	..\contrib\masmx86\match686.asm
