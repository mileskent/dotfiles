#!/bin/bash

cd "$(dirname "$0")"
find . -name "default.sh" -execdir bash "$(basename {})" \;