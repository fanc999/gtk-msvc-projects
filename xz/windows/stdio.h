#ifdef _MSC_VER
# if (_MSC_VER < 1900)
#  include <../include/stdio.h>
# else
#  include <../ucrt/stdio.h>
# endif
#else
# error "This is a stdio.h stub intended for Visual Studio builds..."
#endif

#if (_MSC_VER < 1900)
#include <stdarg.h>

/* taken from the KDEWIN32 implementation of snprintf() */

static int snprintf (char *buffer, size_t count, const char *fmt, ...)
{
	va_list ap;
	int ret;

	va_start(ap, fmt);
	ret = _vsnprintf(buffer, count-1, fmt, ap);
	if (ret < 0) {
		buffer[count-1] = '\0';
		ret = count - 1;
	}
	va_end(ap);
	return ret;
}
#endif