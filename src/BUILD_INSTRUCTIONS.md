# 🔨 Build Instructions / Инструкции по сборке

## Quick Start / Быстрый старт

### Option 1: Using BAT file (Windows)

```bash
TEST_BUILD.bat
```

### Option 2: Using PowerShell (Recommended for Russian Windows)

```powershell
powershell -ExecutionPolicy Bypass -File test-build.ps1
```

### Option 3: Manual commands

```bash
# Install dependencies
npm install

# Clean old build (optional)
# Windows:
rmdir /s /q dist
# Linux/Mac:
rm -rf dist

# Run build
npm run build

# Check result
# Windows:
dir dist
# Linux/Mac:
ls -la dist
```

---

## 🔍 Verification Steps / Шаги проверки

After running the build, check that:

1. ✅ No TypeScript errors
2. ✅ `dist` folder is created
3. ✅ `dist/index.html` exists
4. ✅ `dist/assets/` folder contains JS and CSS files

Example structure:
```
dist/
├── index.html
├── assets/
│   ├── index-[hash].js
│   └── index-[hash].css
└── music-icon.svg
```

---

## ⚠️ Common Issues / Частые проблемы

### Issue 1: TypeScript errors during build

**Before (old)**:
```json
"build": "tsc && vite build"
```

**After (fixed)**:
```json
"build": "vite build"
```

**Solution**: Already fixed in package.json. Vite handles TypeScript compilation automatically.

To check types separately:
```bash
npm run typecheck
```

---

### Issue 2: "dist folder not created"

**Possible causes**:
1. Build errors (check console output)
2. Insufficient disk space
3. Write permissions issue

**Solution**:
```bash
# Check for errors
npm run build 2>&1 | more

# Try clean install
rm -rf node_modules dist
npm install
npm run build
```

---

### Issue 3: Encoding errors in BAT files

**Symptoms**:
- `'neq' is not recognized as an internal or external command`
- Random Russian characters appear as commands

**Cause**: Windows CMD encoding issues with UTF-8 and Cyrillic characters

**Solution**: Use PowerShell script instead:
```powershell
powershell -ExecutionPolicy Bypass -File test-build.ps1
```

Or use manual commands (see Option 3 above).

---

## 🚀 Deploy to Netlify

After successful build:

1. **Verify locally**:
```bash
npm run preview
```
Open http://localhost:4173

2. **Commit changes**:
```bash
git add .
git commit -m "Fix build configuration"
git push
```

3. **Deploy on Netlify**:
   - Go to https://app.netlify.com
   - Connect your repository
   - Build settings:
     - Build command: `npm run build`
     - Publish directory: `dist`
   - Add environment variables (if using Supabase)
   - Deploy!

See detailed instructions in `ДЕПЛОЙ_НА_NETLIFY.md`

---

## 📊 Build Configuration

### vite.config.ts
```typescript
export default defineConfig({
  plugins: [react()],
  build: {
    outDir: 'dist',        // Output directory
    sourcemap: false,       // Don't generate source maps
    minify: 'esbuild',     // Use esbuild for minification
    cssMinify: true,       // Minify CSS
  },
})
```

### package.json
```json
{
  "scripts": {
    "build": "vite build",
    "typecheck": "tsc --noEmit",
    "preview": "vite preview"
  }
}
```

### netlify.toml
```toml
[build]
  command = "npm run build"
  publish = "dist"

[build.environment]
  NODE_VERSION = "20"
```

---

## 🆘 Need Help?

1. Check build output for specific errors
2. Run `npm run typecheck` to check TypeScript
3. Try `npm run preview` to test production build locally
4. Check `ДЕПЛОЙ_НА_NETLIFY.md` for deployment guide
5. See `README.md` for general documentation

---

## ✅ Success Checklist

- [ ] `npm install` completed without errors
- [ ] `npm run build` completed successfully
- [ ] `dist` folder created with files
- [ ] `npm run preview` works locally
- [ ] No TypeScript errors (`npm run typecheck`)
- [ ] Ready to deploy to Netlify!

🎉 **Good luck with your deployment!**
