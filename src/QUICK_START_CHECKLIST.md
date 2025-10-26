# ✅ Quick Start Checklist / Чеклист быстрого старта

## 📦 Первоначальная настройка (1 раз)

### Шаг 1: Клонирование и установка
- [ ] Клонировать репозиторий: `git clone <url>`
- [ ] Перейти в папку: `cd music-teacher-website`
- [ ] Установить зависимости: `npm install`
- [ ] Проверить версию Node.js: `node -v` (должна быть >= 18, рекомендуется 20)

### Шаг 2: Настройка Supabase (опционально)
- [ ] Создать проект на [Supabase](https://supabase.com)
- [ ] Скопировать URL и Anon Key
- [ ] Создать файл `.env` в корне проекта
- [ ] Добавить переменные:
  ```
  VITE_SUPABASE_URL=https://xxxxx.supabase.co
  VITE_SUPABASE_ANON_KEY=eyJxxxxx
  ```
- [ ] Развернуть Edge Functions: `DEPLOY_EDGE_FUNCTIONS.bat`

> **Примечание:** Без Supabase сайт работает в демо-режиме с локальными данными

---

## 🚀 Запуск проекта

### Вариант A: Автоматический (Windows)
- [ ] Запустить: `START.bat`
- [ ] Выбрать опцию 2 (Run development server)
- [ ] Открыть браузер: `http://localhost:5173`

### Вариант B: Ручной
- [ ] Запустить: `npm run dev:client`
- [ ] Открыть браузер: `http://localhost:5173`

---

## 🔐 Вход в админ-панель

- [ ] Нажать `Ctrl + Shift + A` ИЛИ тройной клик по логотипу
- [ ] Ввести пароль: `admin123`
- [ ] **ВАЖНО:** Сменить пароль в настройках!

---

## 🧪 Тестирование перед деплоем

### Локальная сборка
- [ ] Запустить: `TEST_BUILD.bat` (Windows CMD)
  ИЛИ
- [ ] Запустить: `powershell -File test-build.ps1` (PowerShell)
  ИЛИ
- [ ] Запустить: `npm run build`

### Проверка результата
- [ ] Папка `dist` создана
- [ ] В `dist` есть `index.html`
- [ ] В `dist/assets` есть JS и CSS файлы
- [ ] Нет ошибок TypeScript

### Предпросмотр production сборки
- [ ] Запустить: `npm run preview`
- [ ] Открыть: `http://localhost:4173`
- [ ] Проверить все разделы сайта
- [ ] Проверить админ-панель

---

## 🌐 Деплой на Netlify

### Подготовка
- [ ] Зафиксировать изменения: `git add . && git commit -m "Ready for deploy"`
- [ ] Отправить на GitHub: `git push`

### Настройка Netlify
- [ ] Зарегистрироваться на [Netlify](https://app.netlify.com)
- [ ] Нажать "Add new site" → "Import existing project"
- [ ] Подключить GitHub репозиторий
- [ ] Настроить параметры сборки:
  - Build command: `npm run build`
  - Publish directory: `dist`
  - Node version: `20` (автоматически из `.nvmrc`)

### Переменные окружения (если используете Supabase)
- [ ] Перейти в: Site settings → Environment variables
- [ ] Добавить `VITE_SUPABASE_URL`
- [ ] Добавить `VITE_SUPABASE_ANON_KEY`
- [ ] Добавить `VITE_SUPABASE_FUNCTION_URL` (если используете Edge Functions)

### Деплой
- [ ] Нажать "Deploy site"
- [ ] Дождаться окончания сборки (2-5 минут)
- [ ] Открыть сайт по ссылке `*.netlify.app`

### Проверка после деплоя
- [ ] Главная страница загружается
- [ ] Все разделы работают
- [ ] Админ-панель открывается (`Ctrl+Shift+A`)
- [ ] Изображения отображаются
- [ ] Формы работают
- [ ] Аудио/видео плееры работают

---

## 🔧 Решение проблем

### Ошибки при запуске .bat файлов
- [ ] Использовать PowerShell: `powershell -File test-build.ps1`
- [ ] Или ручные команды: `npm run build`

### Ошибка "dist folder not created" на Netlify
- [ ] Проверить package.json: `"build": "vite build"` (без tsc)
- [ ] Проверить локально: `npm run build`
- [ ] Очистить кеш Netlify: Site settings → Clear cache and deploy

### Белый экран после деплоя
- [ ] Открыть DevTools (F12) → Console
- [ ] Проверить ошибки JavaScript
- [ ] Проверить переменные окружения в Netlify
- [ ] Проверить `netlify.toml` (должны быть редиректы)

### Supabase не работает
- [ ] Проверить `.env` файл
- [ ] Развернуть Edge Functions: `DEPLOY_EDGE_FUNCTIONS.bat`
- [ ] Проверить CORS настройки в Supabase
- [ ] В демо-режиме все должно работать локально

---

## 📚 Документация

### Если что-то не работает, смотрите:

1. **[TROUBLESHOOTING.md](./TROUBLESHOOTING.md)** - Решение проблем
2. **[BUILD_INSTRUCTIONS.md](./BUILD_INSTRUCTIONS.md)** - Инструкции по сборке
3. **[ДЕПЛОЙ_НА_NETLIFY.md](./ДЕПЛОЙ_НА_NETLIFY.md)** - Подробный гайд по деплою
4. **[README.md](./README.md)** - Основная документация

### Для администраторов:
- **[ИНСТРУКЦИЯ_ДЛЯ_АДМИНИСТРАТОРА.md](./ИНСТРУКЦИЯ_ДЛЯ_АДМИНИСТРАТОРА.md)**

### Для разработчиков:
- **[ИНСТРУКЦИЯ_ДЛЯ_РАЗРАБОТЧИКА.md](./ИНСТРУКЦИЯ_ДЛЯ_РАЗРАБОТЧИКА.md)**

---

## ✨ Готово!

После выполнения всех пунктов чеклиста у вас должен быть:

✅ Рабочий сайт локально
✅ Успешная production сборка
✅ Развернутый сайт на Netlify
✅ Доступная админ-панель
✅ Настроенный Supabase (или демо-режим)

🎉 **Поздравляем с успешным запуском!**

---

## 🆘 Нужна помощь?

1. Проверьте [TROUBLESHOOTING.md](./TROUBLESHOOTING.md)
2. Откройте консоль браузера (F12) для проверки ошибок
3. Проверьте логи сборки на Netlify
4. Создайте Issue на GitHub с описанием проблемы

**Важные команды для диагностики:**
```bash
node -v              # Проверить версию Node.js
npm -v               # Проверить версию npm
npm run typecheck    # Проверить TypeScript
npm run build        # Локальная сборка
npm run preview      # Предпросмотр production
```
