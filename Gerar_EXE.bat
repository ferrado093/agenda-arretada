@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Gerar executavel - Agenda Arretada

where python >nul 2>nul
if errorlevel 1 (
    echo Python nao encontrado. Instale em https://www.python.org/downloads/
    pause
    exit /b 1
)

if not exist ".venv\Scripts\python.exe" python -m venv .venv
".venv\Scripts\python.exe" -m pip install --upgrade pip
".venv\Scripts\python.exe" -m pip install -r requirements.txt pyinstaller || (echo Falha ao instalar. & pause & exit /b 1)

".venv\Scripts\python.exe" -m PyInstaller --noconfirm --clean --onefile --windowed ^
    --name AgendaArretada main.py || (echo Falha ao gerar o executavel. & pause & exit /b 1)

echo.
echo Pronto! Executavel criado em: %~dp0dist\AgendaArretada.exe
echo Pode copiar esse arquivo para a Area de Trabalho e dar duplo clique.
pause
