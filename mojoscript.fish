#!/bin/env fish

source ~/max-venv/bin/activate.fish
set MAX_PATH (modular config max.path)
set -Ux MODULAR_HOME $HOME/.modular
fish_add_path $MAX_PATH/bin