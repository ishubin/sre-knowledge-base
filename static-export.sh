#!/bin/bash


url="http://localhost:4010"

curl -s -X POST "$url/v1/static-export/start"


echo ""
echo "Waiting for static exporter to finish..."
attemptsLeft=60

until curl -s "$url/v1/static-export/status" | grep '"finished"'
do
    attemptsLeft=$((attemptsLeft-1))
    if [[ "$attemptsLeft" == "0" ]]; then
        echo "Timeout waiting for static exporter to finish"
        exit 1
    fi
    sleep 1
done

echo "Documents are exported"
