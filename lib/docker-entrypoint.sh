#!/usr/bin/env bash

set -euo pipefail

## cryptoforknote-util and cryptonight-hashing have to be
## recompiled for each host for some unknown reason; otherwise,
## node exits with "Illegal instruction (core dumped)" error code 132
echo "Rebuilding dependencies for host (this may take some time)..."
npm rebuild

exec "$@"
