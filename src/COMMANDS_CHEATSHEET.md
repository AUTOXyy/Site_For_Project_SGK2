# ⚡ Commands Cheatsheet / Шпаргалка команд

## 🎯 Самые важные команды

```bash
# Запуск проекта в режиме разработки
npm run dev:client

# Production сборка
npm run build

# Предпросмотр production сборки
npm run preview

# Проверка типов TypeScript
npm run typecheck
```

---

## 📦 Управление зависимостями

```bash
# Установка зависимостей
npm install

# Установка с игнорированием peer dependencies
npm install --legacy-peer-deps

# Обновление зависимостей
npm update

# Очистка и переустановка
rm -rf node_modules package-lock.json
npm install
```

---

## 🔨 Сборка и тестирование

```bash
# Локальная сборка (Windows CMD)
TEST_BUILD.bat

# Локальная сборка (PowerShell - рекомендуется)
powershell -ExecutionPolicy Bypass -File test-build.ps1

# Ручная сборка
npm run build

# Проверка типов без сборки
npm run typecheck

# Сборка + предпросмотр
npm run start
```

---

## 🧹 Очистка кеша

```bash
# Очистка Vite кеша
rm -rf node_modules/.vite

# Очистка dist
rm -rf dist

# Очистка всего (Windows)
rmdir /s /q node_modules dist

# Полная очистка и переустановка
rm -rf node_modules package-lock.json dist node_modules/.vite
npm install
```

---

## 🌐 Запуск серверов

```bash
# Dev сервер (только frontend)
npm run dev:client

# Dev сервер + Node.js backend (если используется)
npm run dev

# Preview production сборки
npm run preview

# Preview на определенном порту
npm run preview -- --port 8080
```

---

## 🗄️ Supabase

```bash
# Деплой Edge Functions (Windows)
DEPLOY_EDGE_FUNCTIONS.bat

# Проверка подключения к Supabase
# Откройте сайт и проверьте консоль браузера (F12)
# Должно быть: "✅ Supabase подключён успешно"

# Логин в Supabase CLI
npx supabase login

# Инициализация Supabase в проекте
npx supabase init

# Деплой функций вручную
npx supabase functions deploy make-server-xxxxxx
```

---

## 🧪 Тестирование

```bash
# Проверка сборки
npm run build && ls -la dist

# Проверка типов
npm run typecheck

# Запуск локального preview
npm run preview

# Открыть в браузере
# Windows:
start http://localhost:5173
# Mac:
open http://localhost:5173
# Linux:
xdg-open http://localhost:5173
```

---

## 🔍 Диагностика

```bash
# Проверка версии Node.js
node -v

# Проверка версии npm
npm -v

# Список установленных пакетов
npm list --depth=0

# Проверка устаревших пакетов
npm outdated

# Аудит безопасности
npm audit

# Исправление уязвимостей
npm audit fix
```

---

## 📁 Работа с файлами

```bash
# Просмотр содержимого dist (Windows)
dir dist /b
tree dist /F

# Просмотр содержимого dist (Linux/Mac)
ls -la dist
tree dist

# Просмотр размера сборки
du -sh dist
du -h dist/*

# Поиск больших файлов
find dist -type f -size +100k -exec ls -lh {} \;
```

---

## 🚀 Git команды

```bash
# Проверка статуса
git status

# Добавление всех изменений
git add .

# Коммит
git commit -m "Your message"

# Пуш на GitHub
git push origin main

# Создание новой ветки
git checkout -b feature-name

# Переключение между ветками
git checkout main
git checkout feature-name

# Слияние веток
git merge feature-name

# Просмотр истории
git log --oneline
```

---

## 🌐 Netlify

```bash
# Установка Netlify CLI
npm install -g netlify-cli

# Логин в Netlify
netlify login

# Инициализация проекта
netlify init

# Локальный dev сервер Netlify
netlify dev

# Деплой (draft)
netlify deploy

# Деплой в production
netlify deploy --prod

# Просмотр статуса сайта
netlify status

# Открыть админку Netlify
netlify open
```

---

## 💻 PowerShell команды (Windows)

```powershell
# Запуск PowerShell скрипта
powershell -ExecutionPolicy Bypass -File test-build.ps1

# Разрешить выполнение скриптов (требует админ прав)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Проверка политики выполнения
Get-ExecutionPolicy

# Очистка dist (PowerShell)
Remove-Item -Recurse -Force dist

# Просмотр содержимого dist
Get-ChildItem dist -Recurse
```

---

## 🔐 Админ-панель

```
# Доступ к админ-панели:
Способ 1: Ctrl + Shift + A
Способ 2: Тройной клик по логотипу

# Стандартный пароль:
admin123

# ВАЖНО: Смените пароль после первого входа!
```

---

## 🛠️ Батники (Windows)

```cmd
# Интерактивное меню
START.bat

# Тест сборки
TEST_BUILD.bat

# Быстрый запуск с очисткой
БЫСТРЫЙ_ЗАПУСК.bat

# Деплой Edge Functions
DEPLOY_EDGE_FUNCTIONS.bat

# Тест API
TEST_API.bat
```

---

## 🆘 Экстренные команды

```bash
# Убить все процессы Node.js (Windows)
taskkill /F /IM node.exe

# Убить процесс на порту 5173 (Linux/Mac)
lsof -ti:5173 | xargs kill -9

# Убить процесс на порту 5173 (Windows)
netstat -ano | findstr :5173
taskkill /PID <PID> /F

# Полный сброс проекта
rm -rf node_modules package-lock.json dist node_modules/.vite
npm install
npm run build

# Принудительная очистка npm кеша
npm cache clean --force
```

---

## 📝 Полезные алиасы (опционально)

Добавьте в `package.json` → `scripts`:

```json
{
  "scripts": {
    "dev": "npm run dev:client",
    "clean": "rm -rf dist node_modules/.vite",
    "clean:all": "rm -rf node_modules package-lock.json dist",
    "reinstall": "npm run clean:all && npm install",
    "test:build": "npm run build && npm run preview",
    "deploy:functions": "npx supabase functions deploy make-server-xxxxxx"
  }
}
```

Использование:
```bash
npm run clean
npm run reinstall
npm run test:build
```

---

## 🎓 Полезные ссылки на документацию

### Внутренняя документация:
- [README.md](./README.md) - Основная документация
- [QUICK_START_CHECKLIST.md](./QUICK_START_CHECKLIST.md) - Чеклист для новичков
- [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) - Решение проблем
- [BUILD_INSTRUCTIONS.md](./BUILD_INSTRUCTIONS.md) - Инструкции по сборке
- [ДЕПЛОЙ_НА_NETLIFY.md](./ДЕПЛОЙ_НА_NETLIFY.md) - Деплой на Netlify

### Внешняя документация:
- [Vite](https://vitejs.dev/) - Сборщик
- [React](https://react.dev/) - Фреймворк
- [Tailwind CSS](https://tailwindcss.com/) - Стили
- [Supabase](https://supabase.com/docs) - Backend
- [Netlify](https://docs.netlify.com/) - Хостинг
- [Motion](https://motion.dev/) - Анимации

---

## ✨ Горячие клавиши в браузере

```
F12                  - Открыть DevTools
Ctrl + Shift + R     - Hard reload (очистка кеша)
Ctrl + Shift + I     - Открыть DevTools
Ctrl + Shift + C     - Инспектор элементов
Ctrl + Shift + A     - Админ-панель (в нашем приложении)
```

---

## 📊 Проверка перед деплоем

```bash
# 1. Проверка типов
npm run typecheck

# 2. Локальная сборка
npm run build

# 3. Проверка размера
ls -lh dist
du -sh dist

# 4. Предпросмотр
npm run preview

# 5. Все ОК? Деплоим!
git add .
git commit -m "Ready for production"
git push
```

---

🎉 **Сохраните этот файл в закладки для быстрого доступа к командам!**
