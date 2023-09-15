#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"
read -p "This will overwrite you home config. Are you sure? (y/n): " -n 1
echo ""
echo "$REPLY"
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsync --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude ".git/" \
        -avh . ~
fi

