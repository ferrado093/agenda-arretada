@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Agenda Arretada

where python >nul 2>nul
if errorlevel 1 (
    echo Python nao encontrado. Instale em https://www.python.org/downloads/
    echo e marque "Add Python to PATH" durante a instalacao.
    pause
    exit /b 1
)

if not exist ".venv\Scripts\pythonw.exe" (
    echo Primeira execucao: preparando o ambiente. Aguarde...
    python -m venv .venv || (echo Falha ao criar o ambiente. & pause & exit /b 1)
    ".venv\Scripts\python.exe" -m pip install --upgrade pip
    ".venv\Scripts\python.exe" -m pip install -r requirements.txt || (echo Falha ao instalar dependencias. & pause & exit /b 1)
)

start "" ".venv\Scripts\pythonw.exe" main.py
exit /b 0
