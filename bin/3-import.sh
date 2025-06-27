#!/bin/bash

main() {

  set -euo pipefail;

  local data="$1";

  test -x bin/libexec/import.php || {

    echo "error: please run this script from project base directory." >&2;

    exit 1;

  }

  sudo -u mysql bin/libexec/import.php "$data" || {

    echo "error: failed to import data." >&2;

    exit 1;

  }
}

main "$@";
