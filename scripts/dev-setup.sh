#!/bin/bash

# Скрипт для настройки PHP-проекта в dev-режиме с использованием Composer



php artisan migrate

echo "🔹 1. Устанавливаем зависимости (включая dev-зависимости)"
composer install --dev --prefer-dist --no-interaction
php artisan migrate

echo "🔹 2. Оптимизируем автозагрузку"
composer dump-autoload --optimize


echo "🔹 3. Копируем .env"
cp ./.env.example ./.env

echo "🔹 4. Создаем symlink storage"
php artisan storage:link

echo "🔹 5. Генерируем ключ"
php artisan key:generate

echo "🔹 6. Собираем node modules"
npm i
npm run build

echo "✅ Готово! Проект настроен для разработки"!
