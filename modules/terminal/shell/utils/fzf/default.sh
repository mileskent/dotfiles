#!/bin/bash

# bash
for f in "$PWD"/bash/*; do
    if [ -f "$f" ]; then
        echo "  -> Sourcing: $(basename "$f")"
        source "$f"
    fi
done
