#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit
read -rp 'This will overwrite you home config. Are you sure? (y/n): ' -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e '\n\nModified/created files: '
    rsync --exclude 'bootstrap.sh' \
        --exclude 'README.md' \
        --exclude '.git/' \
        --exclude '.gitignore' \
        --exclude '.config/nvim/lazy-lock.json' \
        --exclude 'Session.vim' \
        -avhi . ~ | rg -e '^>f' | awk '{print "- " $2} END {if (NR == 0) print "[]"}'
fi
