@echo off
echo ========================================
echo BUILD TEST
echo ========================================
echo.

echo Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo ERROR: npm install failed!
    pause
    exit /b 1
)
echo.

echo Cleaning old build...
if exist dist (
    rmdir /s /q dist
    echo Old dist folder removed
)
echo.

echo Running build...
call npm run build
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Build failed!
    echo.
    echo Check errors above
    pause
    exit /b 1
)
echo.

echo Checking result...
if exist dist (
    echo SUCCESS: dist folder created!
    echo.
    echo Contents of dist folder:
    dir dist /b
    echo.
    echo BUILD SUCCESSFUL!
    echo.
    echo You can now deploy to Netlify
) else (
    echo ERROR: dist folder NOT created!
    echo Check build logs above
)

echo.
pause
