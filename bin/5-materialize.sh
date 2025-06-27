#!/bin/bash

main() {

  set -euo pipefail;

  test -x bin/libexec/fix-views.sh || {

    echo "error: please run this script from project base directory." >&2;

    exit 1;

  }

  sudo -u mysql bin/libexec/fix-views.sh || {

    echo "error: failed to materialize views." >&2;

    exit 1;

  }
}

main "$@";
