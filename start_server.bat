@echo off
cd /d "%~dp0"
echo Starting CS496 study portal on http://localhost:8000
echo Close this window to stop the server.
start "" http://localhost:8000
python -m http.server 8000
pause
