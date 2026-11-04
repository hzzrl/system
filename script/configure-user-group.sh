#!/usr/bin/env bash
set -euo pipefail

sudo usermod -aG video,input,render "$USER"