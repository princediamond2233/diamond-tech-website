@echo off
setlocal
title Diamond Tech - Install
where node >nul 2>nul
if errorlevel 1 (echo Node.js is required. Install Node.js 20 LTS or newer, then run this again.&pause&exit /b 1)
echo Installing website dependencies...
npm install --no-audit --no-fund
if errorlevel 1 (echo Frontend install failed.&pause&exit /b 1)
echo Installing CMS API dependencies...
call npm --prefix server install --no-audit --no-fund
if errorlevel 1 (echo API install failed.&pause&exit /b 1)
if not exist server\.env copy server\.env.example server\.env
if not exist .env copy .env.example .env
echo.
echo Installation complete.
echo Edit server\.env before initializing the database.
pause
