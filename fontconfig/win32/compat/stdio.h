/* Supplementary stdio.h for declaring snprintf() prototype for Visual
 * Studio builds as needed
 */

#ifdef _MSC_VER
# if (_MSC_VER < 1900)
#  include <../include/stdio.h>

#   ifdef __cplusplus
extern "C"
{
#   endif
int snprintf(char* str, size_t size, const char* format, ...);
#   ifdef __cplusplus
}
#   endif

# else
#  include <../ucrt/stdio.h>
# endif
#else
# error "This is meant for Visual Studio builds only!"
#endif
