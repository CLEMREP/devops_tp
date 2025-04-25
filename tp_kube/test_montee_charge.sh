#!/bin/bash

URL="http://localhost:80"
MAX_CONCURRENT_REQUESTS=100000
STEP=10
DELAY=0  # secondes entre chaque palier

echo "🔁 Début du test de montée en charge sur $URL"

for ((i=1000; i<=MAX_CONCURRENT_REQUESTS; i+=STEP)); do
  echo "🚀 Envoi de $i requêtes en parallèle..."

  for ((j=1; j<=i; j++)); do
    curl -s -o /dev/null "$URL" &
  done

  wait  # attendre que toutes les requêtes se terminent
  echo "✅ $i requêtes envoyées. Pause de $DELAY sec."
  sleep $DELAY
done

echo "✅ Test de montée en charge terminé."
