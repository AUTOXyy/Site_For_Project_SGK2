@echo off
cls

echo ================================================================
echo       DEPLOY UPDATED EDGE FUNCTION TO SUPABASE
echo ================================================================
echo.

echo What will be done:
echo.
echo 1. Deploy updated Edge Function to Supabase
echo 2. Test health endpoint
echo 3. Check API functionality
echo.
echo ================================================================
echo.
echo Starting deployment...
echo.

cd /d "%~dp0"

echo Checking Supabase CLI...
supabase --version > nul 2>&1
if errorlevel 1 (
    echo [ERROR] Supabase CLI not installed!
    echo.
    echo Install via: npm install -g supabase
    echo.
    pause
    exit /b 1
)

echo [OK] Supabase CLI found
echo.

echo Checking login status...
supabase projects list > nul 2>&1
if errorlevel 1 (
    echo [ERROR] Not logged in to Supabase!
    echo.
    echo Please run: supabase login
    echo.
    pause
    exit /b 1
)

echo [OK] Logged in
echo.

echo Deploying Edge Function...
echo.
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
echo [OK] Edge Function deployed successfully!
echo.
echo Testing health endpoint...
echo.

timeout /t 3 /nobreak > nul

start https://oqazxfewxttctehgftuy.supabase.co/functions/v1/make-server-322de762/health

echo.
echo ================================================================
echo.
echo [OK] DEPLOYMENT COMPLETE!
echo.
echo What's next:
echo.
echo 1. Check the health endpoint in your browser
echo    You should see JSON with status "ok"
echo.
echo 2. Run your site: START.bat -^> option 2
echo.
echo 3. Login to admin panel: Ctrl + Shift + A
echo    Password: admin123
echo.
echo 4. Try creating a publication or album
echo.
echo ================================================================
echo.
echo Full guide: README.md and ИНСТРУКЦИЯ_ДЛЯ_РАЗРАБОТЧИКА.md
echo.
echo Press any key to exit...
pause > nul
