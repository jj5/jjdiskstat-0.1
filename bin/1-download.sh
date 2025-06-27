#!/bin/bash

main() {

  set -euo pipefail;

  local data="$1";

  test -x bin/libexec/download.sh || {

    echo "error: please run this script from project base directory." >&2;

    exit 1;

  }

  sudo -u mysql bin/libexec/download.sh "$data" || {

    echo "error: failed to download data." >&2;

    exit 1;

  }
}

main "$@";
