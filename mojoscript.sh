#!/bin/bash

curl -s https://get.modular.com | sh -s -- 95c40c94-1316-4ee6-9b2c-a02f19bc6e7c

python3.10 -m venv ~/max-venv && source ~/max-venv/bin/activate
modular install max

MAX_PATH=$(modular config max.path) && python3 -m pip install --find-links $MAX_PATH/wheels max-engine

chmod +x mojoscript.fish
./mojoscript.fish


