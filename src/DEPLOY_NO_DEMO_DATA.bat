@echo off
cls

echo ================================================================
echo    DEPLOY: DISABLED DEMO DATA - CLEAN VERSION
echo ================================================================
echo.

echo This script will:
echo.
echo 1. Deploy Edge Functions WITHOUT auto-creation of demo data
echo 2. All existing demo data will be kept (until you delete it)
echo 3. New demo data will NOT be created automatically
echo.
echo ================================================================
echo.
echo WARNING: After deployment, deleted items will NOT reappear!
echo.

set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" (
    echo.
    echo Cancelled.
    pause
    exit /b 0
)

echo.
echo Deploying Edge Function...
echo.

cd /d "%~dp0"

supabase functions deploy make-server-322de762 --no-verify-jwt

if errorlevel 1 (
    echo.
    echo [ERROR] Deployment failed!
    echo.
    pause
    exit /b 1
)

echo.
echo ================================================================
echo.
echo [OK] DEPLOYMENT COMPLETE!
echo.
echo Demo data auto-creation is now DISABLED.
echo.
echo What this means:
echo.
echo - Deleted items will NOT reappear
echo - You need to add content through admin panel
echo - All your data is managed manually
echo.
echo ================================================================
echo.
echo Press any key to exit...
pause > nul
