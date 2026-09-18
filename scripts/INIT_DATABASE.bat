@echo off
setlocal
title Diamond Tech - Database Setup
if not exist server\.env copy server\.env.example server\.env >nul
call npm --prefix server run db:init
if errorlevel 1 (echo Database initialization failed. Check PostgreSQL and server\.env.&pause&exit /b 1)
echo Database initialized.
pause
