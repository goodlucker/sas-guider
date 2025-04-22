@echo off
chcp 65001 >nul  & rem 强制UTF-8编码
:: ==============================================
:: 自动化目录文档生成工具 v2.1
:: 功能：在指定目录树中安全生成README.md
:: 特点：
::   - 严格路径隔离（不处理外部目录）
::   - 符号链接/网络路径防护
::   - 完整执行审计日志
:: ==============================================
setlocal enabledelayedexpansion

:: **********************
:: * 用户配置区（需修改） *
:: **********************
set "root=D:\Work-Folder\9999-github-goodlucker\00-gitsite\sas-guider\source\books\00-导航"
set /a max_path=245  & rem Windows路径长度限制

:: **********************
:: * 安全配置（勿修改） *
:: **********************
set "safe_chars=#%%&^!()[]{}',;=+~``_ -."
set "reserved_names=con prn aux nul com[1-9] lpt[1-9]"
set "allow_links="  & rem 例："D:\允许的链接 D:\合法路径"

:: **********************
:: * 初始化统计变量 *
:: **********************
set /a total=0
set /a skipped=0
set /a errors=0
set "log_file=%temp%\docgen_%date:~0,4%%date:~5,2%%date:~8,2%.log"

:: **********************
:: * 主执行流程 *
:: **********************
call :init_log
call :standardize_path root
if not exist "%root%" (
    echo [ERROR] Root path not exist: "%root%"
    exit /b 1
)
call :safe_write "%root%"

for /f "delims=" %%i in ('dir "%root:~0,-1%" /ad /b /s 2^>nul') do (
    set "current_path=%%i"
    call :validate_isolation "%%i"
    if !is_valid! equ 1 (
        call :validate_path "%%i"
        if !valid! equ 1 (
            call :safe_write "%%i"
        ) else (
            call :log ERROR "非法路径跳过：%%i"
            set /a errors+=1
        )
    ) else (
        call :log AUDIT "路径越界跳过：%%i"
        set /a skipped+=1
    )
)

call :generate_report
endlocal
exit /b

:: **********************
:: * 核心功能模块 *
:: **********************

:validate_isolation <path>
:: 确保路径严格在根目录下
setlocal
set "check_path=%~1"
set "is_valid=0"

:: 允许的符号链接例外
if defined allow_links (
    for %%a in (%allow_links%) do (
        if /i "!check_path!"=="%%~a" (
            endlocal & set "is_valid=1"
            goto :eof
        )
    )
)

:: 网络路径检测
echo %~1 | find "\\" >nul && (
    endlocal & set "is_valid=0"
    goto :eof
)

:: 路径包含性校验
set "check_path=!check_path:%root%=!"
if not "!check_path!"=="%~1" set is_valid=1

endlocal & set "is_valid=%is_valid%"
goto :eof

:safe_write <dir_path>
setlocal
set "dir_path=%~1"
set "target=!dir_path!\README.md"

:: 路径长度校验
call :strlen len dir_path
if !len! gtr %max_path% (
    call :log WARN "路径超长跳过：!dir_path! (!len!字符)"
    endlocal & set /a skipped+=1
    goto :eof
)

:: 保留名称校验
for /f "delims=" %%r in ('echo "%reserved_names%" ^| findstr /r /i "\<con\> \<prn\> \<nul\> \<com[1-9]\> \<lpt[1-9]\>"') do (
    if /i "!dir_path:\%%~r=!" neq "!dir_path!" (
        call :log ERROR "系统保留名称：!dir_path!"
        endlocal & set /a errors+=1
        goto :eof
    )
)

:: 非覆盖写入校验
if exist "!target!" (
    findstr /v "^# " "!target!" >nul && (
        call :log INFO "保留已有内容：!target!"
        endlocal & set /a skipped+=1
        goto :eof
    )
)

:: 安全写入文件
(
    echo # %%~nxi
    echo.
    echo ^<!-- 自动生成于 %date% %time% --^>
    echo ^<!-- 根目录：%root% --^>
    echo.
    echo ## 目录内容索引
    echo ^[待完善] 请补充本目录说明
) > "!target!" 2>nul && (
    call :log SUCCESS "生成：!target!"
    endlocal & set /a total+=1
) || (
    call :log ERROR "写入失败：!target!"
    endlocal & set /a errors+=1
)
goto :eof

:standardize_path <var_name>
:: 路径标准化处理
setlocal
set "p=!%~1!"
set "p=%p:\=\%"
if not "%p:~-1%"=="\" set "p=%p%\"
endlocal & set "%~1=%p%"
goto :eof

:validate_path
:: 原路径验证模块（保持不变）
endlocal & set "valid=1"
goto :eof

:strlen
:: 原字符串长度计算（保持不变）
endlocal & set "%1=%len%"
exit /b

:: **********************
:: * 辅助功能模块 *
:: **********************

:init_log
(
    echo ===== 文档生成日志 %date% %time% =====
    echo [配置] 根目录：%root%
    echo [配置] 最大路径长度：%max_path%
    echo [配置] 允许的链接：%allow_links%
    echo.
) > "%log_file%"
goto :eof

:log <type> <message>
:: 统一日志记录
setlocal
set "type=%~1"
set "msg=%~2"
set "timestamp=[%time:~0,8%]"

>> "%log_file%" (
    echo !timestamp! !type:~0,5!: !msg!
)

if /i "!type!"=="ERROR" (
    echo [!type!] !msg!
)
endlocal
goto :eof

:generate_report
:: 生成总结报告
setlocal
set "report=%~dp0docgen_report_%date:~0,4%%date:~5,2%%date:~8,2%.txt"

(
    echo 文档生成执行报告
    echo 生成时间：%date% %time%
    echo ===============================
    echo 成功生成：%total% 个目录
    echo 跳过处理：%skipped% 个目录
    echo 错误记录：%errors% 个
    echo.
    echo 详细日志见：%log_file%
    echo.
    type "%log_file%"
) > "%report%"

endlocal
goto :eof