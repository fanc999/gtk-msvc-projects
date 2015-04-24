
#ifndef ICONV_STATIC
# if BUILDING_LIBICONV
#  define LIBICONV_DLL_EXPORTED __declspec(dllexport)
# else
#  define LIBICONV_DLL_EXPORTED __declspec(dllimport)
# endif
#else
# define LIBICONV_DLL_EXPORTED
#endif
