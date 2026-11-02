#!/usr/bin/env just --justfile

dev:
    nix develop

upload:
    rm -r docs || echo "docs already removed"
    just build
    neocities push docs

build:
    NODE_ENV=production ./node_modules/.bin/buildawesome
serve:
    ./node_modules/.bin/buildawesome --serve
