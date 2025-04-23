@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 配置区（按实际修改）
set "root=D:\Work-Folder\9999-github-goodlucker\00-gitsite\sas-guider\source\books\00-nav"
set /a max_path=245
set "log_file=%temp%\docgen.log"

:: ========== 路径标准化模块 ==========
call :standardize_path root

:: 严格校验路径存在性
if not exist "%root%" (
    echo [ERROR] Path does not exist: "%root%"
    echo Possible causes:
    echo 1. Missing backslashes in path
    echo 2. Folder name typo
    echo 3. Drive not mounted
    exit /b 1
)

:: 初始化计数器
set /a total=0
set /a skipped=0
set /a errors=0

:: ========== 主执行流程 ==========
for /f "delims=" %%i in ('dir "%root%" /ad /b /s 2^>nul') do (
    set "current_path=%%i"
    call :validate_isolation "%%i"
    if !is_valid! equ 1 (
        call :safe_write "%%i"
    ) else (
        echo [AUDIT] Skipped external path: %%i
        set /a skipped+=1
    )
)

:: 生成报告
echo Summary Report:
echo Success: %total%
echo Skipped: %skipped%
echo Errors : %errors%
pause
exit /b

:: ========== 核心功能模块 ==========
:safe_write <path>
setlocal
set "dir_path=%~1"
set "folder=%~nx1"
set "target=%dir_path%\README.md"

(
    echo # !folder!
    echo.
    echo ^<! -- Generated: %date% %time% --^>
) > "!target!" 2>nul && (
    endlocal & set /a total+=1
) || (
    endlocal & set /a errors+=1
)
goto :eof

:validate_isolation
setlocal
set "check_path=%~1"
set "is_valid=0"
if "!check_path:%root%=!" neq "!check_path!" set is_valid=1
endlocal & set "is_valid=%is_valid%"
goto :eof

:standardize_path
setlocal
set "p=!%~1!"
set "p=!p://=\!"       & rem 替换双斜杠
set "p=!p:\\=\!"       & rem 保留单反斜杠
if not "!p:~-1!"=="\" set "p=!p!\"
endlocal & set "%~1=%p%"
goto :eof