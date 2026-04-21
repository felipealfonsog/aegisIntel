@echo off
setlocal enabledelayedexpansion

set "PROJECT_NAME=AegisIntel"
set "VENV_DIR=venv"

:menu
cls
echo ========================================
echo   %PROJECT_NAME% - Windows Helper
echo ========================================
echo.
echo Select an option:
echo.
echo   1^) Create virtual environment
echo   2^) Install Python dependencies ^(requirements.txt^)
echo   3^) Full setup ^(1 + 2^)
echo   4^) Run CLI demo
echo   5^) Start API server
echo   6^) Show activation command
echo   0^) Exit
echo.

set /p choice=Option: 

if "%choice%"=="1" goto create_venv
if "%choice%"=="2" goto install_requirements
if "%choice%"=="3" goto full_setup
if "%choice%"=="4" goto run_cli
if "%choice%"=="5" goto run_api
if "%choice%"=="6" goto show_activation
if "%choice%"=="0" goto end

echo.
echo [WARN] Invalid option.
pause
goto menu

:create_venv
echo.
echo [INFO] Creating virtual environment...
python -m venv %VENV_DIR%
if errorlevel 1 (
  echo.
  echo [ERROR] Failed to create virtual environment.
  echo Make sure Python is installed and available in PATH.
  pause
  goto menu
)
echo.
echo [INFO] Virtual environment created successfully.
pause
goto menu

:install_requirements
if not exist "%VENV_DIR%\Scripts\python.exe" (
  echo.
  echo [ERROR] Virtual environment not found. Create it first.
  pause
  goto menu
)

echo.
echo [INFO] Installing Python dependencies...
call "%VENV_DIR%\Scripts\activate.bat"
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
if errorlevel 1 (
  echo.
  echo [ERROR] Failed to install dependencies.
  pause
  goto menu
)
echo.
echo [INFO] Dependencies installed successfully.
pause
goto menu

:full_setup
echo.
echo [INFO] Running full setup...
python -m venv %VENV_DIR%
if errorlevel 1 (
  echo.
  echo [ERROR] Failed to create virtual environment.
  pause
  goto menu
)
call "%VENV_DIR%\Scripts\activate.bat"
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
if errorlevel 1 (
  echo.
  echo [ERROR] Failed during dependency installation.
  pause
  goto menu
)
echo.
echo [INFO] Full setup completed successfully.
pause
goto menu

:run_cli
if not exist "%VENV_DIR%\Scripts\python.exe" (
  echo.
  echo [ERROR] Virtual environment not found. Run setup first.
  pause
  goto menu
)
call "%VENV_DIR%\Scripts\activate.bat"
echo.
echo [INFO] Running CLI demo...
python -m aegisintel.cli.main ioc enrich 8.8.8.8
pause
goto menu

:run_api
if not exist "%VENV_DIR%\Scripts\python.exe" (
  echo.
  echo [ERROR] Virtual environment not found. Run setup first.
  pause
  goto menu
)
call "%VENV_DIR%\Scripts\activate.bat"
echo.
echo [INFO] Starting API server...
echo.
echo Available endpoints:
echo   http://127.0.0.1:8000/health
echo   http://127.0.0.1:8000/ioc/enrich?value=8.8.8.8
echo   http://127.0.0.1:8000/docs
echo.
echo Press CTRL+C to stop the server.
echo.
uvicorn aegisintel.api.main:app --reload
pause
goto menu

:show_activation
echo.
echo Manual activation command:
echo.
echo   %VENV_DIR%\Scripts\activate.bat
echo.
pause
goto menu

:end
echo.
echo [INFO] Goodbye.
endlocal
exit /b 0
