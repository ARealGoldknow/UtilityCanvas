@echo off
setlocal

REM Build a Windows .exe bundle with embedded Python runtime via PyInstaller.
set "SCRIPT_DIR=%~dp0"
set "PROJECT_ROOT=%SCRIPT_DIR%..\.."
set "APP_SCRIPT=%PROJECT_ROOT%\windows_app\vocal_canvas_windows.py"
set "OUTPUT_DIR=%SCRIPT_DIR%dist"
set "WORK_DIR=%SCRIPT_DIR%build"
set "SPEC_DIR=%SCRIPT_DIR%"

if not exist "%APP_SCRIPT%" (
  echo [ERROR] Missing app script:
  echo   %APP_SCRIPT%
  exit /b 1
)

echo [1/3] Installing build dependencies...
python -m pip install --upgrade pip
if errorlevel 1 exit /b 1

python -m pip install -r "%PROJECT_ROOT%\windows_app\requirements.txt" pyinstaller
if errorlevel 1 exit /b 1

echo [2/3] Building VocalCanvasSetup.exe with PyInstaller...
pyinstaller ^
  --noconfirm ^
  --clean ^
  --windowed ^
  --onefile ^
  --name "VocalCanvasSetup" ^
  --distpath "%OUTPUT_DIR%" ^
  --workpath "%WORK_DIR%" ^
  --specpath "%SPEC_DIR%" ^
  "%APP_SCRIPT%"
if errorlevel 1 exit /b 1

echo [3/3] Done.
echo Output:
echo   %OUTPUT_DIR%\VocalCanvasSetup.exe
echo.
echo Note: This .exe is intentionally not linked on the website yet.
endlocal
