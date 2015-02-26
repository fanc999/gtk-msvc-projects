@echo off

if "%CJPEG%" == "" (echo CJPEG must be set first && goto :eof)
if "%DJPEG%" == "" (echo DJPEG must be set first && goto :eof)
if "%JPEGTRAN%" == "" (echo JPEGTRAN must be set first && goto :end)

@fciv > NUL
if not %errorlevel% == 1 goto :skip

@echo 768e970dd57b340ff1b83c9d3d47c77b > cjpeg-rgb-islow.expected.txt
%CJPEG% -rgb -dct int -outfile testout_rgb_islow.jpg ..\..\..\testimages\testorig.ppm
fciv testout_rgb_islow.jpg > cjpeg-rgb-islow.out.tmp

@for /f %%a in ('findstr .jpg cjpeg-rgb-islow.out.tmp') do echo %%a > cjpeg-rgb-islow.out.txt

fc cjpeg-rgb-islow.expected.txt cjpeg-rgb-islow.out.txt
if not %errorlevel% == 0 (echo cjpeg-rgb-islow Failed) else (echo cjpeg-rgb-islow OK)

@echo 00a257f5393fef8821f2b88ac7421291 > djpeg-rgb-islow.expected.txt
%DJPEG% -dct int -ppm -outfile testout_rgb_islow.ppm testout_rgb_islow.jpg
fciv testout_rgb_islow.ppm > djpeg-rgb-islow.out.tmp

@for /f %%a in ('findstr .ppm djpeg-rgb-islow.out.tmp') do echo %%a > djpeg-rgb-islow.out.txt

fc djpeg-rgb-islow.expected.txt djpeg-rgb-islow.out.txt
if not %errorlevel% == 0 (echo djpeg-rgb-islow Failed) else (echo djpeg-rgb-islow OK)

@echo f07d2e75073e4bb10f6c6f4d36e2e3be > djpeg-rgb-islow-565.expected.txt
%DJPEG% -dct int -rgb565 -dither none -bmp -outfile testout_rgb_islow_565.bmp testout_rgb_islow.jpg
fciv testout_rgb_islow_565.bmp > djpeg-rgb-islow-565.out.tmp

@for /f %%a in ('findstr .bmp djpeg-rgb-islow-565.out.tmp') do echo %%a > djpeg-rgb-islow-565.out.txt

fc djpeg-rgb-islow-565.expected.txt djpeg-rgb-islow-565.out.txt
if not %errorlevel% == 0 (echo djpeg-rgb-islow-565 Failed) else (echo djpeg-rgb-islow-565 OK)

@echo 4cfa0928ef3e6bb626d7728c924cfda4 > djpeg-rgb-islow-565D.expected.txt
%DJPEG% -dct int -rgb565 -bmp -outfile testout_rgb_islow_565D.bmp testout_rgb_islow.jpg
fciv testout_rgb_islow_565D.bmp > djpeg-rgb-islow-565D.out.tmp

@for /f %%a in ('findstr .bmp djpeg-rgb-islow-565D.out.tmp') do echo %%a > djpeg-rgb-islow-565D.out.txt

fc djpeg-rgb-islow-565D.expected.txt djpeg-rgb-islow-565D.out.txt
if not %errorlevel% == 0 (echo djpeg-rgb-islow-565D Failed) else (echo djpeg-rgb-islow-565D OK)

@echo 2540287b79d913f91665e660303ab2c8 > cjpeg-422-ifast-opt.expected.txt
%CJPEG% -sample 2x1 -dct fast -opt -outfile testout_422_ifast_opt.jpg ..\..\..\testimages\testorig.ppm
fciv testout_422_ifast_opt.jpg > cjpeg-422-ifast-opt.out.tmp

@for /f %%a in ('findstr .jpg cjpeg-422-ifast-opt.out.tmp') do echo %%a > cjpeg-422-ifast-opt.out.txt

fc cjpeg-422-ifast-opt.expected.txt cjpeg-422-ifast-opt.out.txt
if not %errorlevel% == 0 (echo cjpeg-422-ifast-opt Failed) else (echo cjpeg-422-ifast-opt OK)

@echo 35bd6b3f833bad23de82acea847129fa > djpeg-422-ifast.expected.txt
%DJPEG% -dct fast -outfile testout_422_ifast.ppm testout_422_ifast_opt.jpg
fciv testout_422_ifast.ppm > djpeg-422-ifast.out.tmp

@for /f %%a in ('findstr .ppm djpeg-422-ifast.out.tmp') do echo %%a > djpeg-422-ifast.out.txt

fc djpeg-422-ifast.expected.txt djpeg-422-ifast.out.txt
if not %errorlevel% == 0 (echo djpeg-422-ifast Failed) else (echo djpeg-422-ifast OK)

@echo 8dbc65323d62cca7c91ba02dd1cfa81d > djpeg-422m-ifast.expected.txt
%DJPEG% -dct fast -nosmooth -outfile testout_422m_ifast.ppm testout_422_ifast_opt.jpg
fciv testout_422m_ifast.ppm > djpeg-422m-ifast.out.tmp

@for /f %%a in ('findstr .ppm djpeg-422m-ifast.out.tmp') do echo %%a > djpeg-422m-ifast.out.txt

fc djpeg-422m-ifast.expected.txt djpeg-422m-ifast.out.txt
if not %errorlevel% == 0 (echo djpeg-422m-ifast Failed) else (echo djpeg-422m-ifast OK)

@echo 3294bd4d9a1f2b3d08ea6020d0db7065 > djpeg-422m-ifast-565.expected.txt
%DJPEG% -dct int -nosmooth -rgb565 -dither none -bmp -outfile testout_422m_ifast_565.bmp testout_422_ifast_opt.jpg
fciv testout_422m_ifast_565.bmp > djpeg-422m-ifast-565.out.tmp

@for /f %%a in ('findstr .bmp djpeg-422m-ifast-565.out.tmp') do echo %%a > djpeg-422m-ifast-565.out.txt

fc djpeg-422m-ifast-565.expected.txt djpeg-422m-ifast-565.out.txt
if not %errorlevel% == 0 (echo djpeg-422m-ifast-565 Failed) else (echo djpeg-422m-ifast-565 OK)

@echo da98c9c7b6039511be4a79a878a9abc1 > djpeg-422m-ifast-565D.expected.txt
%DJPEG% -dct int -nosmooth -rgb565 -bmp -outfile testout_422m_ifast_565D.bmp testout_422_ifast_opt.jpg
fciv testout_422m_ifast_565D.bmp > djpeg-422m-ifast-565D.out.tmp

@for /f %%a in ('findstr .bmp djpeg-422m-ifast-565D.out.tmp') do echo %%a > djpeg-422m-ifast-565D.out.txt

fc djpeg-422m-ifast-565D.expected.txt djpeg-422m-ifast-565D.out.txt
if not %errorlevel% == 0 (echo djpeg-422m-ifast-565D Failed) else (echo djpeg-422m-ifast-565D OK)

@echo 990cbe0329c882420a2094da7e5adade > cjpeg-420-q100-ifast-prog.expected.txt
%CJPEG% -sample 2x2 -quality 100 -dct fast -prog -outfile testout_420_q100_ifast_prog.jpg ..\..\..\testimages\testorig.ppm
fciv testout_420_q100_ifast_prog.jpg > cjpeg-420-q100-ifast-prog.out.tmp

@for /f %%a in ('findstr .jpg cjpeg-420-q100-ifast-prog.out.tmp') do echo %%a > cjpeg-420-q100-ifast-prog.out.txt

fc cjpeg-420-q100-ifast-prog.expected.txt cjpeg-420-q100-ifast-prog.out.txt
if not %errorlevel% == 0 (echo cjpeg-420-q100-ifast-prog Failed) else (echo cjpeg-420-q100-ifast-prog OK)



@echo 5a732542015c278ff43635e473a8a294 > djpeg-420-q100-ifast-prog.expected.txt
%DJPEG% -dct fast -outfile testout_420_q100_ifast.ppm testout_420_q100_ifast_prog.jpg
fciv testout_420_q100_ifast.ppm > djpeg-420-q100-ifast-prog.out.tmp

@for /f %%a in ('findstr .ppm djpeg-420-q100-ifast-prog.out.tmp') do echo %%a > djpeg-420-q100-ifast-prog.out.txt

fc djpeg-420-q100-ifast-prog.expected.txt djpeg-420-q100-ifast-prog.out.txt
if not %errorlevel% == 0 (echo djpeg-420-q100-ifast-prog Failed) else (echo djpeg-420-q100-ifast-prog OK)

@echo ff692ee9323a3b424894862557c092f1 > djpeg-420m-q100-ifast-prog.expected.txt
%DJPEG% -dct fast -nosmooth -outfile testout_420m_q100_ifast.ppm testout_420_q100_ifast_prog.jpg
fciv testout_420m_q100_ifast.ppm > djpeg-420m-q100-ifast-prog.out.tmp

@for /f %%a in ('findstr .ppm djpeg-420m-q100-ifast-prog.out.tmp') do echo %%a > djpeg-420m-q100-ifast-prog.out.txt

fc djpeg-420m-q100-ifast-prog.expected.txt djpeg-420m-q100-ifast-prog.out.txt
if not %errorlevel% == 0 (echo djpeg-420m-q100-ifast-prog Failed) else (echo djpeg-420m-q100-ifast-prog OK)

@echo 72b51f894b8f4a10b3ee3066770aa38d > cjpeg-gray-islow.expected.txt
%CJPEG% -gray -dct int -outfile testout_gray_islow.jpg ..\..\..\testimages\testorig.ppm
fciv testout_gray_islow.jpg > cjpeg-gray-islow.out.tmp

@for /f %%a in ('findstr .jpg cjpeg-gray-islow.out.tmp') do echo %%a > cjpeg-gray-islow.out.txt

fc cjpeg-gray-islow.expected.txt cjpeg-gray-islow.out.txt
if not %errorlevel% == 0 (echo cjpeg-gray-islow Failed) else (echo cjpeg-gray-islow OK)

@echo 8d3596c56eace32f205deccc229aa5ed > djpeg-gray-islow.expected.txt
%DJPEG% -dct int -outfile testout_gray_islow.ppm testout_gray_islow.jpg
fciv testout_gray_islow.ppm > djpeg-gray-islow.out.tmp

@for /f %%a in ('findstr .ppm djpeg-gray-islow.out.tmp') do echo %%a > djpeg-gray-islow.out.txt

fc djpeg-gray-islow.expected.txt djpeg-gray-islow.out.txt
if not %errorlevel% == 0 (echo djpeg-gray-islow Failed) else (echo djpeg-gray-islow OK)


@echo 116424ac07b79e5e801f00508eab48ec > djpeg-gray-islow-rgb.expected.txt
%DJPEG% -dct int -rgb -outfile testout_gray_islow_rgb.ppm testout_gray_islow.jpg
fciv testout_gray_islow_rgb.ppm > djpeg-gray-islow-rgb.out.tmp

@for /f %%a in ('findstr .ppm djpeg-gray-islow-rgb.out.tmp') do echo %%a > djpeg-gray-islow-rgb.out.txt

fc djpeg-gray-islow-rgb.expected.txt djpeg-gray-islow-rgb.out.txt
if not %errorlevel% == 0 (echo djpeg-gray-islow-rgb Failed) else (echo djpeg-gray-islow-rgb OK)


@echo 12f78118e56a2f48b966f792fedf23cc > djpeg-gray-islow-565.expected.txt
%DJPEG% -dct int -rgb565 -dither none -bmp -outfile testout_gray_islow_565.bmp testout_gray_islow.jpg
fciv testout_gray_islow_565.bmp > djpeg-gray-islow-565.out.tmp

@for /f %%a in ('findstr .bmp djpeg-gray-islow-565.out.tmp') do echo %%a > djpeg-gray-islow-565.out.txt

fc djpeg-gray-islow-565.expected.txt djpeg-gray-islow-565.out.txt
if not %errorlevel% == 0 (echo djpeg-gray-islow-565 Failed) else (echo djpeg-gray-islow-565 OK)


@echo bdbbd616441a24354c98553df5dc82db > djpeg-gray-islow-565D.expected.txt
%DJPEG% -dct int -rgb565 -bmp -outfile testout_gray_islow_565D.bmp testout_gray_islow.jpg
fciv testout_gray_islow_565D.bmp > djpeg-gray-islow-565D.out.tmp

@for /f %%a in ('findstr .bmp djpeg-gray-islow-565D.out.tmp') do echo %%a > djpeg-gray-islow-565D.out.txt

fc djpeg-gray-islow-565D.expected.txt djpeg-gray-islow-565D.out.txt
if not %errorlevel% == 0 (echo djpeg-gray-islow-565D Failed) else (echo djpeg-gray-islow-565D OK)

@echo 388708217ac46273ca33086b22827ed8 > cjpeg-420s-ifast-opt.expected.txt
%CJPEG% -sample 2x2 -smooth 1 -dct int -opt -outfile testout_420s_ifast_opt.jpg ..\..\..\testimages\testorig.ppm
fciv testout_420s_ifast_opt.jpg > cjpeg-420s-ifast-opt.out.tmp

@for /f %%a in ('findstr .jpg cjpeg-420s-ifast-opt.out.tmp') do echo %%a > cjpeg-420s-ifast-opt.out.txt

fc cjpeg-420s-ifast-opt.expected.txt cjpeg-420s-ifast-opt.out.txt
if not %errorlevel% == 0 (echo cjpeg-420s-ifast-opt Failed) else (echo cjpeg-420s-ifast-opt OK)

@echo 343e3f8caf8af5986ebaf0bdc13b5c71 > cjpeg-3x2-float-prog.expected.txt
%CJPEG% -sample 3x2 -dct float -prog -outfile testout_3x2_float_prog.jpg ..\..\..\testimages\testorig.ppm
fciv testout_3x2_float_prog.jpg > cjpeg-3x2-float-prog.out.tmp

@for /f %%a in ('findstr .jpg cjpeg-3x2-float-prog.out.tmp') do echo %%a > cjpeg-3x2-float-prog.out.txt

fc cjpeg-3x2-float-prog.expected.txt cjpeg-3x2-float-prog.out.txt
if not %errorlevel% == 0 (echo cjpeg-3x2-float-prog Failed) else (echo cjpeg-3x2-float-prog OK)

@echo 1a75f36e5904d6fc3a85a43da9ad89bb > djpeg-3x2-float-prog.expected.txt
%DJPEG% -dct float -outfile testout_3x2_float.ppm testout_3x2_float_prog.jpg
fciv testout_3x2_float.ppm > djpeg-3x2-float-prog.out.tmp

@for /f %%a in ('findstr .ppm djpeg-3x2-float-prog.out.tmp') do echo %%a > djpeg-3x2-float-prog.out.txt

fc djpeg-3x2-float-prog.expected.txt djpeg-3x2-float-prog.out.txt
if not %errorlevel% == 0 (echo djpeg-3x2-float-prog Failed) else (echo djpeg-3x2-float-prog OK)

@echo e986fb0a637a8d833d96e8a6d6d84ea1 > cjpeg-420-islow-ari.expected.txt
%CJPEG% -dct int -arithmetic -outfile testout_420_islow_ari.jpg ..\..\..\testimages\testorig.ppm
fciv testout_420_islow_ari.jpg > cjpeg-420-islow-ari.out.tmp

@for /f %%a in ('findstr .jpg cjpeg-420-islow-ari.out.tmp') do echo %%a > cjpeg-420-islow-ari.out.txt

fc cjpeg-420-islow-ari.expected.txt cjpeg-420-islow-ari.out.txt
if not %errorlevel% == 0 (echo cjpeg-420-islow-ari Failed) else (echo cjpeg-420-islow-ari OK)

@echo e986fb0a637a8d833d96e8a6d6d84ea1 > jpegtran-420-islow-ari.expected.txt
%JPEGTRAN% -arithmetic -outfile testout_420_islow_ari.jpg ..\..\..\testimages\testimgint.jpg
fciv testout_420_islow_ari.jpg > jpegtran-420-islow-ari.out.tmp

@for /f %%a in ('findstr .jpg jpegtran-420-islow-ari.out.tmp') do echo %%a > jpegtran-420-islow-ari.out.txt

fc jpegtran-420-islow-ari.expected.txt jpegtran-420-islow-ari.out.txt
if not %errorlevel% == 0 (echo jpegtran-420-islow-ari Failed) else (echo jpegtran-420-islow-ari OK)

@echo 0a8f1c8f66e113c3cf635df0a475a617 > cjpeg-444-islow-progari.expected.txt
%CJPEG% -sample 1x1 -dct int -progressive -arithmetic -outfile testout_444_islow_progari.jpg ..\..\..\testimages\testorig.ppm
fciv testout_444_islow_progari.jpg > cjpeg-444-islow-progari.out.tmp

@for /f %%a in ('findstr .jpg cjpeg-444-islow-progari.out.tmp') do echo %%a > cjpeg-444-islow-progari.out.txt

fc cjpeg-444-islow-progari.expected.txt cjpeg-444-islow-progari.out.txt
if not %errorlevel% == 0 (echo cjpeg-444-islow-progari Failed) else (echo cjpeg-444-islow-progari OK)

@echo 72b59a99bcf1de24c5b27d151bde2437 > djpeg-420m-ifast-ari.expected.txt
%DJPEG% -fast -ppm -outfile testout_420m_ifast_ari.ppm ..\..\..\testimages\testimgari.jpg
fciv testout_420m_ifast_ari.ppm > djpeg-420m-ifast-ari.out.tmp

@for /f %%a in ('findstr .ppm djpeg-420m-ifast-ari.out.tmp') do echo %%a > djpeg-420m-ifast-ari.out.txt

fc djpeg-420m-ifast-ari.expected.txt djpeg-420m-ifast-ari.out.txt
if not %errorlevel% == 0 (echo djpeg-420m-ifast-ari Failed) else (echo djpeg-420m-ifast-ari OK)

@echo 9a68f56bc76e466aa7e52f415d0f4a5f > jpegtran-420-islow.expected.txt
%JPEGTRAN% -outfile testout_420_islow.jpg ..\..\..\testimages\testimgari.jpg
fciv testout_420_islow.jpg > jpegtran-420-islow.out.tmp

@for /f %%a in ('findstr .jpg jpegtran-420-islow.out.tmp') do echo %%a > jpegtran-420-islow.out.txt

fc jpegtran-420-islow.expected.txt jpegtran-420-islow.out.txt
if not %errorlevel% == 0 (echo jpegtran-420-islow Failed) else (echo jpegtran-420-islow OK)

REM *** Looped Tests
@echo 9f9de8c0612f8d06869b960b05abf9c9 > djpeg-420m-islow-2_1.expected.txt
@echo b6875bc070720b899566cc06459b63b7 > djpeg-420m-islow-15_8.expected.txt
@echo bc3452573c8152f6ae552939ee19f82f > djpeg-420m-islow-13_8.expected.txt
@echo d8cc73c0aaacd4556569b59437ba00a5 > djpeg-420m-islow-11_8.expected.txt
@echo d25e61bc7eac0002f5b393aa223747b6 > djpeg-420m-islow-9_8.expected.txt
@echo ddb564b7c74a09494016d6cd7502a946 > djpeg-420m-islow-7_8.expected.txt
@echo 8ed8e68808c3fbc4ea764fc9d2968646 > djpeg-420m-islow-3_4.expected.txt
@echo a3363274999da2366a024efae6d16c9b > djpeg-420m-islow-5_8.expected.txt
@echo e692a315cea26b988c8e8b29a5dbcd81 > djpeg-420m-islow-1_2.expected.txt
@echo 79eca9175652ced755155c90e785a996 > djpeg-420m-islow-3_8.expected.txt
@echo 79cd778f8bf1a117690052cacdd54eca > djpeg-420m-islow-1_4.expected.txt
@echo 391b3d4aca640c8567d6f8745eb2142f > djpeg-420m-islow-1_8.expected.txt

for %%a in (2_1 15_8 13_8 11_8 9_8 7_8 3_4 5_8 1_2 3_8 1_4 1_8) do call :call_loop %%a

goto :continue

:call_loop
  if not "%1" == "" (
    set a=%1
SETLOCAL EnableDelayedExpansion
    set b=!a:_=/!
    %DJPEG% -dct int -scale !b! -nosmooth -ppm -outfile testout_420m_islow_%1.ppm ..\..\..\testimages\testorig.jpg
ENDLOCAL
    fciv testout_420m_islow_%1.ppm > djpeg-420m-islow-%1.out.tmp

    @for /f %%a in ('findstr .ppm djpeg-420m-islow-%1.out.tmp') do echo %%a > djpeg-420m-islow-%1.out.txt

    fc djpeg-420m-islow-%1.expected.txt djpeg-420m-islow-%1.out.txt
    if not %errorlevel% == 0 (echo djpeg-420m-islow-%1 Failed) else (echo djpeg-420m-islow-%1 OK)
  )
  goto :EOF

:continue
REM *** End of Looped Tests


@echo 4980185e3776e89bd931736e1cddeee6 > djpeg-420-islow-256.expected.txt
%DJPEG% -dct int -colors 256 -bmp -outfile testout_420_islow_256.bmp ..\..\..\testimages\testorig.jpg
fciv testout_420_islow_256.bmp > djpeg-420-islow-256.out.tmp

@for /f %%a in ('findstr .bmp djpeg-420-islow-256.out.tmp') do echo %%a > djpeg-420-islow-256.out.txt

fc djpeg-420-islow-256.expected.txt djpeg-420-islow-256.out.txt
if not %errorlevel% == 0 (echo djpeg-420-islow-256 Failed) else (echo djpeg-420-islow-256 OK)

@echo bf9d13e16c4923b92e1faa604d7922cb > djpeg-420-islow-565.expected.txt
%DJPEG% -dct int -rgb565 -dither none -bmp -outfile testout_420_islow_565.bmp ..\..\..\testimages\testorig.jpg
fciv testout_420_islow_565.bmp > djpeg-420-islow-565.out.tmp

@for /f %%a in ('findstr .bmp djpeg-420-islow-565.out.tmp') do echo %%a > djpeg-420-islow-565.out.txt

fc djpeg-420-islow-565.expected.txt djpeg-420-islow-565.out.txt
if not %errorlevel% == 0 (echo djpeg-420-islow-565 Failed) else (echo djpeg-420-islow-565 OK)

@echo 6bde71526acc44bcff76f696df8638d2 > djpeg-420-islow-565D.expected.txt
%DJPEG% -dct int -rgb565 -bmp -outfile testout_420_islow_565D.bmp ..\..\..\testimages\testorig.jpg
fciv testout_420_islow_565D.bmp > djpeg-420-islow-565D.out.tmp

@for /f %%a in ('findstr .bmp djpeg-420-islow-565D.out.tmp') do echo %%a > djpeg-420-islow-565D.out.txt

fc djpeg-420-islow-565D.expected.txt djpeg-420-islow-565D.out.txt
if not %errorlevel% == 0 (echo djpeg-420-islow-565D Failed) else (echo djpeg-420-islow-565D OK)

@echo 8dc0185245353cfa32ad97027342216f > djpeg-420m-islow-565.expected.txt
%DJPEG% -dct int -nosmooth -rgb565 -dither none -bmp -outfile testout_420m_islow_565.bmp ..\..\..\testimages\testorig.jpg
fciv testout_420m_islow_565.bmp > djpeg-420m-islow-565.out.tmp

@for /f %%a in ('findstr .bmp djpeg-420m-islow-565.out.tmp') do echo %%a > djpeg-420m-islow-565.out.txt

fc djpeg-420m-islow-565.expected.txt djpeg-420m-islow-565.out.txt
if not %errorlevel% == 0 (echo djpeg-420m-islow-565 Failed) else (echo djpeg-420m-islow-565 OK)

@echo d1be3a3339166255e76fa50a0d70d73e > djpeg-420m-islow-565D.expected.txt
%DJPEG% -dct int -nosmooth -rgb565 -bmp -outfile testout_420m_islow_565.bmp ..\..\..\testimages\testorig.jpg
fciv testout_420m_islow_565.bmp > djpeg-420m-islow-565D.out.tmp

@for /f %%a in ('findstr .bmp djpeg-420m-islow-565D.out.tmp') do echo %%a > djpeg-420m-islow-565D.out.txt

fc djpeg-420m-islow-565D.expected.txt djpeg-420m-islow-565D.out.txt
if not %errorlevel% == 0 (echo djpeg-420m-islow-565D Failed) else (echo djpeg-420m-islow-565D OK)

@echo b4197f377e621c4e9b1d20471432610d > jpegtran-crop.expected.txt
%JPEGTRAN% -crop 120x90+20+50 -transpose -perfect -outfile testout_crop.jpg ..\..\..\testimages\testorig.jpg
fciv testout_crop.jpg > jpegtran-crop.out.tmp

@for /f %%a in ('findstr .jpg jpegtran-crop.out.tmp') do echo %%a > jpegtran-crop.out.txt

fc jpegtran-crop.expected.txt jpegtran-crop.out.txt
if not %errorlevel% == 0 (echo jpegtran-crop Failed) else (echo jpegtran-crop OK)

del *.bmp
del *.jpg
del *.ppm
del *.out.txt
del *.out.tmp
del *.expected.txt

goto :eof

:skip
@echo Skipping cjpeg tests as fciv utility is not found in PATH (Program Built Successfully though).
