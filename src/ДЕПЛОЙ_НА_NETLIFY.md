# 🚀 Инструкция по деплою на Netlify

## 📋 Предварительная проверка

### 1. Проверьте локальную сборку

Запустите файл `TEST_BUILD.bat` для проверки:

```bash
# Windows
TEST_BUILD.bat

# Linux/Mac
npm run build
```

Убедитесь, что:
- ✅ Сборка завершается без ошибок
- ✅ Папка `dist` создаётся
- ✅ В папке `dist` есть файлы `index.html`, `assets/` и т.д.

### 2. Зафиксируйте изменения в Git

```bash
git add .
git commit -m "Fix build configuration for Netlify"
git push origin main
```

---

## 🌐 Деплой на Netlify

### Вариант 1: Через GitHub (рекомендуется)

1. **Зайдите на [Netlify](https://app.netlify.com/)**

2. **Нажмите "Add new site" → "Import an existing project"**

3. **Выберите GitHub и найдите ваш репозиторий**

4. **Настройте параметры сборки:**
   - **Branch to deploy**: `main` (или `with-bild`)
   - **Build command**: `npm run build`
   - **Publish directory**: `dist`
   - **Node version**: `20` (уже настроено в `.nvmrc`)

5. **Добавьте переменные окружения** (если используете Supabase):
   - Перейдите в **Site settings** → **Environment variables**
   - Добавьте:
     - `VITE_SUPABASE_URL` = ваш Supabase URL
     - `VITE_SUPABASE_ANON_KEY` = ваш Supabase Anon Key
     - `VITE_SUPABASE_FUNCTION_URL` = URL вашей Edge Function

6. **Нажмите "Deploy site"**

### Вариант 2: Через Netlify CLI

```bash
# Установите Netlify CLI
npm install -g netlify-cli

# Войдите в аккаунт
netlify login

# Инициализируйте проект
netlify init

# Деплой
netlify deploy --prod
```

---

## ⚙️ Настройки после деплоя

### 1. Настройка домена

1. Перейдите в **Site settings** → **Domain management**
2. Добавьте свой домен или используйте `*.netlify.app`

### 2. Настройка HTTPS

Netlify автоматически настраивает SSL сертификат через Let's Encrypt.

### 3. Настройка переадресации

Уже настроено в `netlify.toml`:
- SPA редиректы (все пути → `/index.html`)
- Кеширование статических ресурсов
- Заголовки безопасности

---

## 🔧 Решение проблем

### Ошибка: "Deploy directory 'dist' does not exist"

**Причина**: Сборка не создала папку `dist`

**Решение**:
1. Проверьте локальную сборку: `npm run build`
2. Проверьте, что в `package.json` используется `"build": "vite build"`
3. Проверьте, что в `vite.config.ts` указано `outDir: 'dist'`
4. Очистите кеш: `rm -rf node_modules dist && npm install && npm run build`

### Ошибка TypeScript

**Причина**: `tsc` выдаёт ошибки компиляции

**Решение**: Уже исправлено! Теперь используется только `vite build` без `tsc`.

Для проверки типов отдельно используйте:
```bash
npm run typecheck
```

### Белый экран после деплоя

**Причины**:
1. Неправильные пути к ресурсам
2. Отсутствуют переменные окружения
3. Ошибки в консоли браузера

**Решение**:
1. Откройте DevTools (F12) → Console
2. Проверьте ошибки
3. Убедитесь, что переменные окружения настроены
4. Проверьте, что `netlify.toml` содержит правильные редиректы

### Медленная загрузка

**Решение**:
1. Включите сжатие в Netlify (включено по умолчанию)
2. Проверьте размер bundle: `npm run build -- --report`
3. Оптимизируйте изображения
4. Настройте кеширование (уже настроено в `netlify.toml`)

---

## 📊 Мониторинг

### Просмотр логов сборки
1. Перейдите в **Deploys**
2. Выберите нужный деплой
3. Просмотрите логи

### Статистика сайта
1. **Site analytics** - посещаемость
2. **Performance** - скорость загрузки
3. **Forms** - статистика форм (если используете Netlify Forms)

---

## 🎯 Checklist перед деплоем

- [ ] Локальная сборка работает (`npm run build`)
- [ ] Папка `dist` создаётся
- [ ] Проект зафиксирован в Git
- [ ] Переменные окружения настроены (если нужны)
- [ ] `.nvmrc` файл создан (версия Node.js = 20)
- [ ] `netlify.toml` настроен правильно
- [ ] `.gitignore` не игнорирует важные файлы

---

## 📚 Полезные ссылки

- [Netlify Documentation](https://docs.netlify.com/)
- [Vite Build Options](https://vitejs.dev/config/build-options.html)
- [Troubleshooting Builds](https://docs.netlify.com/configure-builds/troubleshooting-tips/)
- [Environment Variables](https://docs.netlify.com/environment-variables/overview/)

---

## 🆘 Поддержка

Если проблема не решается:

1. Проверьте логи сборки на Netlify
2. Запустите `TEST_BUILD.bat` локально
3. Проверьте версию Node.js: `node -v` (должна быть 20.x)
4. Очистите кеш Netlify: **Site settings** → **Build & deploy** → **Clear cache and deploy site**

---

## ✅ После успешного деплоя

1. Проверьте все страницы сайта
2. Проверьте админ-панель (Ctrl + Shift + A)
3. Проверьте отзывы, фото, видео
4. Проверьте формы обратной связи
5. Проверьте аудио/видео плееры
6. Проверьте адаптивность (мобильная версия)

🎉 **Поздравляем с успешным деплоем!**
