#!/bin/bash

API_URL="http://localhost/api/posts"

echo "🔨 Создание нового поста:"
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"title": "Пример", "content": "Контент"}'

echo -e "\n📥 Получение всех постов:"
RESPONSE=$(curl -s "$API_URL")
echo "$RESPONSE"

# Получаем последний ID
LAST_ID=$(echo "$RESPONSE" | grep -o '"id":[0-9]*' | grep -o '[0-9]*' | tail -n1)

if [ -n "$LAST_ID" ]; then
  echo -e "\n🗑️ Удаление поста с ID=$LAST_ID:"
  curl -s -X DELETE "$API_URL/$LAST_ID"
  echo -e "\n✅ Пост удалён."
else
  echo -e "\n⚠️ Не удалось определить ID последнего поста."
fi

echo -e "\n🏁 Готово."


