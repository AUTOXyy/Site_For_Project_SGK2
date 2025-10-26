@echo off
cls

echo ================================================================
echo             TESTING API EDGE FUNCTION
echo ================================================================
echo.

echo Testing public health endpoint...
echo.
echo URL: https://oqazxfewxttctehgftuy.supabase.co/functions/v1/make-server-322de762/health
echo.
echo Opening in browser...
start https://oqazxfewxttctehgftuy.supabase.co/functions/v1/make-server-322de762/health
echo.

timeout /t 3 /nobreak > nul

echo.
echo ================================================================
echo.
echo [OK] Health check endpoint opened in browser!
echo.
echo You should see JSON with server status info:
echo {
echo   "status": "ok",
echo   "timestamp": "...",
echo   "version": "1.0.0",
echo   "data": { ... }
echo }
echo.
echo ================================================================
echo.
echo For testing other endpoints:
echo.
echo 1. Open your site and login to admin panel
echo    (Ctrl + Shift + A or triple click on logo)
echo.
echo 2. Try creating a publication or album
echo.
echo 3. All requests automatically include Authorization
echo.
echo ================================================================
echo.
echo Full guide: README.md and ИНСТРУКЦИЯ_ДЛЯ_РАЗРАБОТЧИКА.md
echo.
echo Press any key to exit...
pause > nul
