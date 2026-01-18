#!/bin/bash

mkdir -p ~/.config/fish

if [ -f /srv/python/config/fish/config.fish ]; then
    ln -sf /srv/python/config/fish/config.fish ~/.config/fish/config.fish
fi

exec fish
