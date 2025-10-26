# 🔧 Решение проблем / Troubleshooting

## 🐛 Проблемы со сборкой / Build Issues

### ❌ Ошибка: 'neq' is not recognized as an internal or external command

**Проблема:** Ошибки кодировки в .bat файлах при использовании русского языка Windows.

**Решение:**

**Вариант 1 (Рекомендуется):** Используйте PowerShell
```powershell
powershell -ExecutionPolicy Bypass -File test-build.ps1
```

**Вариант 2:** Используйте ручные команды
```bash
npm install
npm run build
```

**Вариант 3:** Переключите кодовую страницу CMD (может не помочь)
```cmd
chcp 1251
npm run build
```

---

### ❌ Ошибка: Deploy directory 'dist' does not exist

**Проблема:** Netlify не находит папку dist после сборки.

**Причины:**
1. Ошибки TypeScript блокируют сборку
2. Неправильная конфигурация vite.config.ts
3. Ошибки в package.json

**Решение:**

✅ **Уже исправлено!** В новой версии:
- `package.json`: `"build": "vite build"` (без tsc)
- Проверка типов: отдельная команда `npm run typecheck`

**Проверьте локально:**
```bash
# Используйте скрипт
TEST_BUILD.bat
# или PowerShell
powershell -File test-build.ps1

# Или вручную
npm run build
dir dist  # Windows
ls dist   # Linux/Mac
```

---

### ❌ TypeScript ошибки: 'X' is declared but never used

**Проблема:** Неиспользуемые импорты в компонентах.

**Решение:** ✅ Уже исправлено в версии после коммита.

Если появляются новые ошибки:
```bash
npm run typecheck
```

Удалите неиспользуемые импорты из файлов.

---

## 🌐 Проблемы с деплоем / Deployment Issues

### ❌ Белый экран после деплоя на Netlify

**Причины:**
1. Отсутствуют переменные окружения
2. Ошибки JavaScript в браузере
3. Неправильные редиректы SPA

**Решение:**

1. **Откройте DevTools (F12) → Console** и проверьте ошибки

2. **Проверьте переменные окружения в Netlify:**
   - Site settings → Environment variables
   - Добавьте `VITE_SUPABASE_URL` и `VITE_SUPABASE_ANON_KEY`

3. **Проверьте netlify.toml:**
```toml
[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

4. **Очистите кеш Netlify:**
   - Site settings → Build & deploy → Clear cache and deploy site

---

### ❌ Supabase Functions не работают

**Проблема:** API запросы возвращают 404 или CORS ошибки.

**Решение:**

1. **Проверьте деплой Edge Functions:**
```bash
DEPLOY_EDGE_FUNCTIONS.bat
```

2. **Проверьте переменные окружения:**
```bash
VITE_SUPABASE_URL=https://xxxxx.supabase.co
VITE_SUPABASE_ANON_KEY=eyJxxxxx
VITE_SUPABASE_FUNCTION_URL=https://xxxxx.supabase.co/functions/v1/make-server-xxxxxx
```

3. **Проверьте CORS в Supabase Functions:**
В файле `supabase/functions/make-server-*/index.ts` должны быть заголовки:
```typescript
'Access-Control-Allow-Origin': '*',
'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
```

4. **Тестируйте в демо-режиме:**
Если Supabase не настроен, сайт работает с демо-данными автоматически.

---

## 💻 Проблемы с разработкой / Development Issues

### ❌ Tailwind CSS стили не работают

**Проблема:** Нет градиентов, кнопки выглядят неправильно.

**Решение:**

1. **Проверьте конфигурацию:**
```bash
# Должны существовать
postcss.config.cjs
tailwind.config.cjs
styles/globals.css
```

2. **Очистите кеш:**
```bash
БЫСТРЫЙ_ЗАПУСК.bat
# или
rm -rf node_modules/.vite dist
npm install
npm run dev:client
```

3. **Hard reload в браузере:**
```
Ctrl + Shift + R  (Windows/Linux)
Cmd + Shift + R   (Mac)
```

4. **Проверьте импорт в main.tsx:**
```typescript
import './styles/globals.css'
```

---

### ❌ npm install выдаёт ошибки

**Проблема:** Конфликты зависимостей или версий Node.js.

**Решение:**

1. **Проверьте версию Node.js:**
```bash
node -v   # Должна быть >= 18.x (рекомендуется 20.x)
```

2. **Используйте правильную версию:**
```bash
# Установите nvm (Node Version Manager)
# Windows: https://github.com/coreybutler/nvm-windows
# Linux/Mac: https://github.com/nvm-sh/nvm

nvm install 20
nvm use 20
```

3. **Очистите и переустановите:**
```bash
rm -rf node_modules package-lock.json
npm install
```

4. **Используйте --legacy-peer-deps (если нужно):**
```bash
npm install --legacy-peer-deps
```

---

### ❌ Motion/Framer Motion ошибки

**Проблема:** Ошибки импорта анимаций.

**Решение:**

✅ Проект использует новый пакет `motion` (не `framer-motion`).

**Правильный импорт:**
```typescript
import { motion } from "motion/react"
```

**НЕправильный:**
```typescript
import { motion } from "framer-motion"  // ❌ Старый пакет
```

---

## 📁 Проблемы с файлами / File Issues

### ❌ Загруженные файлы не отображаются

**Проблема:** Изображения/PDF не загружаются в Supabase Storage.

**Решение:**

1. **Проверьте Storage Policies в Supabase:**
   - Dashboard → Storage → Policies
   - Должны быть включены: `SELECT`, `INSERT`, `UPDATE` для authenticated

2. **Проверьте размер файла:**
   - Максимум: 50MB (можно настроить в Supabase)

3. **Проверьте формат файла:**
   - Изображения: JPG, PNG, GIF, WEBP
   - Документы: PDF, DOCX
   - Аудио: MP3
   - Видео: VK iframe (не файлы)

4. **Проверьте бакеты в Supabase:**
```
Нужные бакеты:
- photos
- documents
- audio
- videos (для thumbnail)
```

---

## 🔐 Проблемы с админ-панелью / Admin Panel Issues

### ❌ Не могу войти в админ-панель

**Проблема:** Пароль не подходит.

**Стандартный пароль:**
```
admin123
```

**Способы входа:**
- `Ctrl + Shift + A`
- Тройной клик по логотипу

**Если забыли пароль:**
См. инструкцию в `ИНСТРУКЦИЯ_ДЛЯ_РАЗРАБОТЧИКА.md` раздел "Смена пароля"

---

### ❌ Админ-панель не сохраняет изменения

**Проблема:** После редактирования данные не сохраняются.

**Причины:**
1. Supabase Functions не развернуты
2. Неправильные переменные окружения
3. Работа в демо-режиме

**Решение:**

1. **Проверьте консоль браузера (F12):**
   - Ищите ошибки API
   - Проверьте Network tab

2. **Разверните Edge Functions:**
```bash
DEPLOY_EDGE_FUNCTIONS.bat
```

3. **Проверьте .env:**
```bash
VITE_SUPABASE_URL=https://xxxxx.supabase.co
VITE_SUPABASE_ANON_KEY=eyJxxxxx
VITE_SUPABASE_FUNCTION_URL=https://xxxxx.supabase.co/functions/v1/make-server-xxxxxx
```

4. **В демо-режиме:**
Данные сохраняются только в localStorage и пропадают при обновлении страницы.

---

## 🔄 Общие рекомендации / General Tips

### ✅ Перед обращением за помощью:

1. **Проверьте консоль браузера** (F12 → Console)
2. **Проверьте логи сборки** (если проблема с деплоем)
3. **Попробуйте очистить кеш:**
```bash
rm -rf node_modules/.vite dist
npm install
npm run build
```

4. **Проверьте документацию:**
   - `README.md` - общая информация
   - `BUILD_INSTRUCTIONS.md` - инструкции по сборке
   - `ДЕПЛОЙ_НА_NETLIFY.md` - деплой на Netlify
   - `ИНСТРУКЦИЯ_ДЛЯ_РАЗРАБОТЧИКА.md` - техническая документация

5. **Проверьте версии:**
```bash
node -v        # >= 18.x
npm -v         # >= 9.x
```

---

## 📞 Получить помощь / Get Help

1. Проверьте Issues на GitHub
2. Создайте новый Issue с описанием проблемы
3. Приложите:
   - Скриншоты ошибок
   - Логи консоли
   - Версию Node.js (`node -v`)
   - ОС и браузер

---

## ✅ Quick Fixes Checklist

При любой проблеме попробуйте:

- [ ] Перезапустить dev-сервер
- [ ] Очистить кеш браузера (Ctrl+Shift+R)
- [ ] Удалить node_modules и переустановить: `rm -rf node_modules && npm install`
- [ ] Проверить .env файл
- [ ] Проверить версию Node.js (должна быть 18+ или 20)
- [ ] Проверить консоль браузера (F12)
- [ ] Попробовать в режиме инкогнито
- [ ] Очистить Vite кеш: `rm -rf node_modules/.vite`

🎉 **Большинство проблем решаются одним из этих способов!**
