@echo off
set OUTPUT_DIR=build

REM 获取当前日期（格式：yyyyMMdd 例如：20240121）
for /f %%i in ('powershell -Command "Get-Date -Format 'yyyyMMdd'"') do set DATE_SUFFIX=%%i

if not exist %OUTPUT_DIR% (
    mkdir %OUTPUT_DIR%
)

set GOOS=linux
set GOARCH=amd64
go build -o build/ysptp_linux_amd64_%DATE_SUFFIX%

set GOOS=linux
set GOARCH=arm
set GOARM=7
go build -o build/ysptp_linux_armv7_%DATE_SUFFIX%

set GOOS=linux
set GOARCH=arm64
go build -o build/ysptp_linux_arm64_%DATE_SUFFIX%

set GOOS=windows
set GOARCH=amd64
go build -o build/ysptp_windows_amd64_%DATE_SUFFIX%.exe

echo Build completed!
pause