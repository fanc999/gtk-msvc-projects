
#ifndef ICONV_STATIC
# if BUILDING_LIBCHARSET
#   define LIBCHARSET_DLL_EXPORTED __declspec(dllexport)
# else
#   define LIBCHARSET_DLL_EXPORTED __declspec(dllimport)
# endif
#else
# define LIBCHARSET_DLL_EXPORTED
#endif
