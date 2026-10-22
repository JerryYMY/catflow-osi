@echo off
chcp 65001 >nul
title CatFlow-Marimo: Closed-Loop Catalyst Inverse Designer

echo ========================================================
echo   CatFlow-Marimo: Closed-Loop Catalyst Inverse Designer
echo   Open Scientific Intelligence Hackathon 2026
echo ========================================================
echo.

cd /d "%~dp0"
set PYTHONDONTWRITEBYTECODE=1

REM Environment detection: user venv -> local .venv -> system PATH
set "VENV_MARIMO="
if exist "C:\Users\z5539728\.venvs\catflow-agent\Scripts\marimo.exe" (
    set "VENV_MARIMO=C:\Users\z5539728\.venvs\catflow-agent\Scripts\marimo.exe"
) else if exist "%~dp0.venv\Scripts\marimo.exe" (
    set "VENV_MARIMO=%~dp0.venv\Scripts\marimo.exe"
) else (
    where marimo >nul 2>&1
    if not errorlevel 1 (
        set "VENV_MARIMO=marimo"
    )
)

if "%VENV_MARIMO%"=="" (
    echo [ERROR] Marimo executable not found in:
    echo   - C:\Users\z5539728\.venvs\catflow-agent
    echo   - %~dp0.venv
    echo   - System PATH
    echo.
    echo [TIP] You can directly double-click 'catflow_interactive_demo.html' in this folder
    echo       to open the full interactive discovery dashboard with ZERO Python dependency!
    pause
    exit /b 1
)

echo [INFO] Starting Marimo Reactive Web App on http://localhost:2718 ...
echo [INFO] Your default browser will launch automatically.
echo [TIP]  Alternatively, double-click 'catflow_interactive_demo.html' for instant browser viewing.
echo.
"%VENV_MARIMO%" run app.py --port 2718
pause
