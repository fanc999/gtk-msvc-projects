@echo off

if "%CJPEG%" == "" (echo CJPEG must be set first && goto :eof)
if "%DJPEG%" == "" (echo DJPEG must be set first && goto :eof)
if "%JPEGTRAN%" == "" (echo JPEGTRAN must be set first && goto :eof)
if "%MD5CMP%" == "" (echo MD5CMP must be set first && goto :eof)

%CJPEG% -rgb -dct int -outfile testout_rgb_islow.jpg ..\..\testimages\testorig.ppm
%MD5CMP% 768e970dd57b340ff1b83c9d3d47c77b testout_rgb_islow.jpg

%DJPEG% -dct int -ppm -outfile testout_rgb_islow.ppm testout_rgb_islow.jpg
%MD5CMP% 00a257f5393fef8821f2b88ac7421291 testout_rgb_islow.ppm

%DJPEG% -dct int -rgb565 -dither none -bmp -outfile testout_rgb_islow_565.bmp testout_rgb_islow.jpg
%MD5CMP% f07d2e75073e4bb10f6c6f4d36e2e3be testout_rgb_islow_565.bmp

%DJPEG% -dct int -rgb565 -bmp -outfile testout_rgb_islow_565D.bmp testout_rgb_islow.jpg
%MD5CMP% 4cfa0928ef3e6bb626d7728c924cfda4 testout_rgb_islow_565D.bmp

%CJPEG% -sample 2x1 -dct fast -opt -outfile testout_422_ifast_opt.jpg ..\..\testimages\testorig.ppm
%MD5CMP% 2540287b79d913f91665e660303ab2c8 testout_422_ifast_opt.jpg

%DJPEG% -dct fast -outfile testout_422_ifast.ppm testout_422_ifast_opt.jpg
%MD5CMP% 35bd6b3f833bad23de82acea847129fa testout_422_ifast.ppm

%DJPEG% -dct fast -nosmooth -outfile testout_422m_ifast.ppm testout_422_ifast_opt.jpg
%MD5CMP% 8dbc65323d62cca7c91ba02dd1cfa81d testout_422m_ifast.ppm

%DJPEG% -dct int -nosmooth -rgb565 -dither none -bmp -outfile testout_422m_ifast_565.bmp testout_422_ifast_opt.jpg
%MD5CMP% 3294bd4d9a1f2b3d08ea6020d0db7065 testout_422m_ifast_565.bmp

%DJPEG% -dct int -nosmooth -rgb565 -bmp -outfile testout_422m_ifast_565D.bmp testout_422_ifast_opt.jpg
%MD5CMP% da98c9c7b6039511be4a79a878a9abc1 testout_422m_ifast_565D.bmp

%CJPEG% -sample 2x2 -quality 100 -dct fast -prog -outfile testout_420_q100_ifast_prog.jpg ..\..\testimages\testorig.ppm
%MD5CMP% 990cbe0329c882420a2094da7e5adade testout_420_q100_ifast_prog.jpg

%DJPEG% -dct fast -outfile testout_420_q100_ifast.ppm testout_420_q100_ifast_prog.jpg
%MD5CMP% 5a732542015c278ff43635e473a8a294 testout_420_q100_ifast.ppm

%DJPEG% -dct fast -nosmooth -outfile testout_420m_q100_ifast.ppm testout_420_q100_ifast_prog.jpg
%MD5CMP% ff692ee9323a3b424894862557c092f1 testout_420m_q100_ifast.ppm

%CJPEG% -gray -dct int -outfile testout_gray_islow.jpg ..\..\testimages\testorig.ppm
%MD5CMP% 72b51f894b8f4a10b3ee3066770aa38d testout_gray_islow.jpg

%DJPEG% -dct int -outfile testout_gray_islow.ppm testout_gray_islow.jpg
%MD5CMP% 8d3596c56eace32f205deccc229aa5ed testout_gray_islow.ppm

%DJPEG% -dct int -rgb -outfile testout_gray_islow_rgb.ppm testout_gray_islow.jpg
%MD5CMP% 116424ac07b79e5e801f00508eab48ec testout_gray_islow_rgb.ppm

%DJPEG% -dct int -rgb565 -dither none -bmp -outfile testout_gray_islow_565.bmp testout_gray_islow.jpg
%MD5CMP% 12f78118e56a2f48b966f792fedf23cc testout_gray_islow_565.bmp

%DJPEG% -dct int -rgb565 -bmp -outfile testout_gray_islow_565D.bmp testout_gray_islow.jpg
%MD5CMP% bdbbd616441a24354c98553df5dc82db testout_gray_islow_565D.bmp

%CJPEG% -sample 2x2 -smooth 1 -dct int -opt -outfile testout_420s_ifast_opt.jpg ..\..\testimages\testorig.ppm
%MD5CMP% 388708217ac46273ca33086b22827ed8 testout_420s_ifast_opt.jpg

%CJPEG% -sample 3x2 -dct float -prog -outfile testout_3x2_float_prog.jpg ..\..\testimages\testorig.ppm
%MD5CMP% 343e3f8caf8af5986ebaf0bdc13b5c71 testout_3x2_float_prog.jpg

%DJPEG% -dct float -outfile testout_3x2_float.ppm testout_3x2_float_prog.jpg
%MD5CMP% 1a75f36e5904d6fc3a85a43da9ad89bb testout_3x2_float.ppm

%CJPEG% -dct int -arithmetic -outfile testout_420_islow_ari.jpg ..\..\testimages\testorig.ppm
%MD5CMP% e986fb0a637a8d833d96e8a6d6d84ea1 testout_420_islow_ari.jpg

%JPEGTRAN% -arithmetic -outfile testout_420_islow_ari.jpg ..\..\testimages\testimgint.jpg
%MD5CMP% e986fb0a637a8d833d96e8a6d6d84ea1 testout_420_islow_ari.jpg

%CJPEG% -sample 1x1 -dct int -progressive -arithmetic -outfile testout_444_islow_progari.jpg ..\..\testimages\testorig.ppm
%MD5CMP% 0a8f1c8f66e113c3cf635df0a475a617 testout_444_islow_progari.jpg

%DJPEG% -fast -ppm -outfile testout_420m_ifast_ari.ppm ..\..\testimages\testimgari.jpg
%MD5CMP% 72b59a99bcf1de24c5b27d151bde2437 testout_420m_ifast_ari.ppm

%JPEGTRAN% -outfile testout_420_islow.jpg ..\..\testimages\testimgari.jpg
%MD5CMP% 9a68f56bc76e466aa7e52f415d0f4a5f testout_420_islow.jpg

REM *** Looped Tests
%DJPEG% -dct int -scale 2/1 -nosmooth -ppm -outfile testout_420m_islow_2_1.ppm ..\..\testimages\testorig.jpg
%MD5CMP% 9f9de8c0612f8d06869b960b05abf9c9 testout_420m_islow_2_1.ppm

%DJPEG% -dct int -scale 15/8 -nosmooth -ppm -outfile testout_420m_islow_15_8.ppm ..\..\testimages\testorig.jpg
%MD5CMP% b6875bc070720b899566cc06459b63b7 testout_420m_islow_15_8.ppm

%DJPEG% -dct int -scale 13/8 -nosmooth -ppm -outfile testout_420m_islow_13_8.ppm ..\..\testimages\testorig.jpg
%MD5CMP% bc3452573c8152f6ae552939ee19f82f testout_420m_islow_13_8.ppm

%DJPEG% -dct int -scale 11/8 -nosmooth -ppm -outfile testout_420m_islow_11_8.ppm ..\..\testimages\testorig.jpg
%MD5CMP% d8cc73c0aaacd4556569b59437ba00a5 testout_420m_islow_11_8.ppm

%DJPEG% -dct int -scale 9/8 -nosmooth -ppm -outfile testout_420m_islow_9_8.ppm ..\..\testimages\testorig.jpg
%MD5CMP% d25e61bc7eac0002f5b393aa223747b6 testout_420m_islow_9_8.ppm

%DJPEG% -dct int -scale 7/8 -nosmooth -ppm -outfile testout_420m_islow_7_8.ppm ..\..\testimages\testorig.jpg
%MD5CMP% ddb564b7c74a09494016d6cd7502a946 testout_420m_islow_7_8.ppm

%DJPEG% -dct int -scale 3/4 -nosmooth -ppm -outfile testout_420m_islow_3_4.ppm ..\..\testimages\testorig.jpg
%MD5CMP% 8ed8e68808c3fbc4ea764fc9d2968646 testout_420m_islow_3_4.ppm

%DJPEG% -dct int -scale 5/8 -nosmooth -ppm -outfile testout_420m_islow_5_8.ppm ..\..\testimages\testorig.jpg
%MD5CMP% a3363274999da2366a024efae6d16c9b testout_420m_islow_5_8.ppm

%DJPEG% -dct int -scale 1/2 -nosmooth -ppm -outfile testout_420m_islow_1_2.ppm ..\..\testimages\testorig.jpg
%MD5CMP% e692a315cea26b988c8e8b29a5dbcd81 testout_420m_islow_1_2.ppm

%DJPEG% -dct int -scale 3/8 -nosmooth -ppm -outfile testout_420m_islow_3_8.ppm ..\..\testimages\testorig.jpg
%MD5CMP% 79eca9175652ced755155c90e785a996 testout_420m_islow_3_8.ppm

%DJPEG% -dct int -scale 1/4 -nosmooth -ppm -outfile testout_420m_islow_1_4.ppm ..\..\testimages\testorig.jpg
%MD5CMP% 79cd778f8bf1a117690052cacdd54eca testout_420m_islow_1_4.ppm

%DJPEG% -dct int -scale 1/8 -nosmooth -ppm -outfile testout_420m_islow_1_8.ppm ..\..\testimages\testorig.jpg
%MD5CMP% 391b3d4aca640c8567d6f8745eb2142f testout_420m_islow_1_8.ppm

%DJPEG% -dct int -colors 256 -bmp -outfile testout_420_islow_256.bmp ..\..\testimages\testorig.jpg
%MD5CMP% 4980185e3776e89bd931736e1cddeee6 testout_420_islow_256.bmp

%DJPEG% -dct int -rgb565 -dither none -bmp -outfile testout_420_islow_565.bmp ..\..\testimages\testorig.jpg
%MD5CMP% bf9d13e16c4923b92e1faa604d7922cb testout_420_islow_565.bmp

%DJPEG% -dct int -rgb565 -bmp -outfile testout_420_islow_565D.bmp ..\..\testimages\testorig.jpg
%MD5CMP% 6bde71526acc44bcff76f696df8638d2 testout_420_islow_565D.bmp

%DJPEG% -dct int -nosmooth -rgb565 -dither none -bmp -outfile testout_420m_islow_565.bmp ..\..\testimages\testorig.jpg
%MD5CMP% 8dc0185245353cfa32ad97027342216f testout_420m_islow_565.bmp

%DJPEG% -dct int -nosmooth -rgb565 -bmp -outfile testout_420m_islow_565.bmp ..\..\testimages\testorig.jpg
%MD5CMP% d1be3a3339166255e76fa50a0d70d73e testout_420m_islow_565.bmp

%DJPEG% -dct int -skip 15,31 -ppm -outfile testout_420_islow_skip15,31.ppm ..\..\testimages\testorig.jpg
%MD5CMP% c4c65c1e43d7275cd50328a61e6534f0 testout_420_islow_skip15,31.ppm

%DJPEG% -dct int -skip 16,139 -ppm -outfile testout_420_islow_ari_skip16,139.ppm ..\..\testimages\testimgari.jpg
%MD5CMP% 087c6b123db16ac00cb88c5b590bb74a testout_420_islow_ari_skip16,139.ppm

%CJPEG% -dct int -prog -outfile testout_420_islow_prog.jpg ..\..\testimages\testorig.ppm
%DJPEG% -dct int -crop 62x62+71+71 -ppm -outfile testout_420_islow_prog_crop62x62,71,71.ppm testout_420_islow_prog.jpg
%MD5CMP% 26eb36ccc7d1f0cb80cdabb0ac8b5d99 testout_420_islow_prog_crop62x62,71,71.ppm

%DJPEG% -dct int -crop 53x53+4+4 -ppm -outfile testout_420_islow_ari_crop53x53,4,4.ppm ..\..\testimages\testimgari.jpg
%MD5CMP% 886c6775af22370257122f8b16207e6d testout_420_islow_ari_crop53x53,4,4.ppm

%CJPEG% -dct int -sample 1x1 -outfile testout_444_islow.jpg ..\..\testimages\testorig.ppm
%DJPEG% -dct int -skip 1,6 -ppm -outfile testout_444_islow_skip1,6.ppm testout_444_islow.jpg
%MD5CMP% 5606f86874cf26b8fcee1117a0a436a6 testout_444_islow_skip1,6.ppm

%CJPEG% -dct int -prog -sample 1x1 -outfile testout_444_islow_prog.jpg ..\..\testimages\testorig.ppm
%DJPEG% -dct int -crop 98x98+13+13 -ppm -outfile testout_444_islow_prog_crop98x98,13,13.ppm testout_444_islow_prog.jpg
%MD5CMP% db87dc7ce26bcdc7a6b56239ce2b9d6c testout_444_islow_prog_crop98x98,13,13.ppm

%CJPEG% -dct int -arithmetic -sample 1x1 -outfile testout_444_islow_ari.jpg ..\..\testimages\testorig.ppm
%DJPEG% -dct int -crop 37x37+0+0 -ppm -outfile testout_444_islow_ari_crop37x37,0,0.ppm testout_444_islow_ari.jpg
%MD5CMP% cb57b32bd6d03e35432362f7bf184b6d testout_444_islow_ari_crop37x37,0,0.ppm

%JPEGTRAN% -crop 120x90+20+50 -transpose -perfect -outfile testout_crop.jpg ..\..\testimages\testorig.jpg
%MD5CMP% b4197f377e621c4e9b1d20471432610d testout_crop.jpg

del *.bmp
del *.jpg
del *.ppm

goto :eof
