#!/bin/bash

cd "$(dirname "$0")"
find . -name "default.bash" -execdir bash "$(basename {})" \;
