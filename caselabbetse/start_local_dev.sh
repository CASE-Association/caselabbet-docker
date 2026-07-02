#!/usr/bin/env bash

# Fail directlly on non exit code 0
set -euo pipefail

IMAGE_NAME="caselabbet"
CONTAINER_NAME="caselabbet"

INVENTORY_SRC="../inventory/data_out/inventory.json"
INVENTORY_DST="/var/www/inventory/inventory.json"

echo "Checking inventory..."

if [[ ! -f "$INVENTORY_SRC" ]]; then
    echo "Inventory file not found:"
    echo "      $INVENTORY_SRC"
    echo

    read -rp "Generate inventory now? [Y/n] " reply

    case "${reply,,}" in
        ""|y|yes)
            echo "Generating inventory..."

            pushd ../inventory >/dev/null
            uv run main.py
            popd >/dev/null

            if [[ ! -f "$INVENTORY_SRC" ]]; then
                echo "Inventory generation failed."
                exit 1
            fi
            ;;
        *)
            echo "Aborted."
            exit 1
            ;;
    esac
fi

echo "Building Docker image..."
docker build -t "$IMAGE_NAME" .

echo "Removing old container (if it exists)..."
docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true

echo "Starting container..."
docker run -d \
    --name "$CONTAINER_NAME" \
    -p 8000:8080 \
    "$IMAGE_NAME"

echo "Creating inventory directory..."
docker exec "$CONTAINER_NAME" mkdir -p /var/www/inventory

echo "Copying inventory.json..."
docker cp "$INVENTORY_SRC" "$CONTAINER_NAME:$INVENTORY_DST"

echo "Server is running!"
echo "http://localhost:8000"
