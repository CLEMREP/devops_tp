#!/bin/bash

# Configuration
URL="http://localhost:8000"
TOTAL_VOTES=100
DELAY=0.1  # Delay between requests in seconds

# Vote options — you can change these to match OPTION_A and OPTION_B
OPTIONS=("Cats" "Dogs")

echo "🐾 Starting vote simulation to $URL..."

for ((i=1; i<=TOTAL_VOTES; i++)); do
  VOTE=${OPTIONS[$RANDOM % ${#OPTIONS[@]}]}
  VOTER_ID=$(openssl rand -hex 8)

  echo "🗳️  Sending vote #$i: $VOTE from voter_id=$VOTER_ID"

  curl -s -X POST "$URL" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "Cookie: voter_id=$VOTER_ID" \
    --data "vote=$VOTE" > /dev/null &

  sleep $DELAY
done

# Wait for all background requests to finish
wait

echo "✅ Finished sending $TOTAL_VOTES simulated votes!"
