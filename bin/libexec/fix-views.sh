#!/bin/bash

main() {

  set -euo pipefail;

  bin/libexec/drop-views.php || {
    echo "error: failed to drop views." >&2;
    exit 1;
  }

  bin/libexec/create-views.php || {
    echo "error: failed to create views." >&2;
    exit 1;
  }

  bin/libexec/materialize-views.php || {
    echo "error: failed to materialize views." >&2;
    exit 1;
  }
}

main "$@";
