@echo off

setlocal enabledelayedexpansion

rem Lookup in Registry to find installation path of Windows 8 SDK (64-bit systems)
for /f "tokens=*" %%f in ('reg query "HKLM\Software\Wow6432Node\Microsoft\Microsoft SDKs\Windows\v8.0" -v InstallationFolder ^|findstr "REG_SZ"') do (for %%x in (%%f) do if not "%%x" == "InstallationFolder" if not "%%x" == "REG_SZ" set WIN8_SDK_DIR=!WIN8_SDK_DIR!%%x )

rem Retry looking up Registry for Windows 8 SDK (32-bit systems)
if "!WIN8_SDK_DIR!" == "" for /f "tokens=*" %%f in ('reg query "HKLM\Software\Microsoft\Microsoft SDKs\Windows\v8.0" -v InstallationFolder ^|findstr "REG_SZ"') do (for %%x in (%%f) do if not "%%x" == "InstallationFolder" if not "%%x" == "REG_SZ" set WIN8_SDK_DIR=!WIN8_SDK_DIR!%%x )

rem Found Windows 8 SDK
if not "!WIN8_SDK_DIR!" == "" echo WIN8_SDK_DIR=!WIN8_SDK_DIR!>win8sdk.vc

rem Did not find Windows 8 SDK
if "!WIN8_SDK_DIR!" == "" echo WIN8_SDK_DIR=xxxxx>win8sdk.vc
endlocal
