@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0.."
echo === Pasta: %CD%
git add -A
git status --short

if not "%~1"=="" (
  set "COMMIT_MSG=%~1"
) else (
  set /p "COMMIT_MSG=Mensagem do commit: "
)

if not defined COMMIT_MSG (
  echo Mensagem vazia. Abortado.
  pause
  exit /b 1
)

git commit -m "!COMMIT_MSG!"
if errorlevel 1 (
  echo Nada a commitar ou commit falhou. Ver mensagem acima.
  pause
  exit /b 1
)
git push origin main
if errorlevel 1 (
  echo Push falhou. Ver credenciais e rede.
  pause
  exit /b 1
)
echo OK. Ultimo commit:
git log -1 --oneline
pause
