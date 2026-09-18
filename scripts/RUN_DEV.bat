@echo off
setlocal
title Diamond Tech - Development
if not exist server\.env (copy server\.env.example server\.env >nul)
if not exist .env (copy .env.example .env >nul)
start "Diamond Tech API" cmd /k "npm --prefix server run dev"
timeout /t 2 /nobreak >nul
start "Diamond Tech Website" cmd /k "npm run dev"
echo Website: http://127.0.0.1:5173
echo API:     http://127.0.0.1:5080/api/health
pause
