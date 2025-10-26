# PowerShell Build Test Script
# Run with: powershell -ExecutionPolicy Bypass -File test-build.ps1

Write-Host ""
Write-Host "========================================"
Write-Host "BUILD TEST"
Write-Host "========================================"
Write-Host ""

# Install dependencies
Write-Host "Installing dependencies..."
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: npm install failed!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host ""

# Clean old build
Write-Host "Cleaning old build..."
if (Test-Path "dist") {
    Remove-Item -Recurse -Force "dist"
    Write-Host "Old dist folder removed" -ForegroundColor Green
}
Write-Host ""

# Run build
Write-Host "Running build..."
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "ERROR: Build failed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Check errors above"
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host ""

# Check result
Write-Host "Checking result..."
if (Test-Path "dist") {
    Write-Host "SUCCESS: dist folder created!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Contents of dist folder:"
    Get-ChildItem "dist" | Select-Object Name
    Write-Host ""
    Write-Host "BUILD SUCCESSFUL!" -ForegroundColor Green
    Write-Host ""
    Write-Host "You can now deploy to Netlify"
} else {
    Write-Host "ERROR: dist folder NOT created!" -ForegroundColor Red
    Write-Host "Check build logs above"
}

Write-Host ""
Read-Host "Press Enter to exit"
