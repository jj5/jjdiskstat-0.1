#!/bin/bash

main() {

  set -euo pipefail;

  # 2025-06-27 jj5 - NOTE: this is the data file we use, you can change it if you want to
  # 2025-06-27 jj5 - SEE: https://www.backblaze.com/cloud-storage/resources/hard-drive-test-data
  #
  local data="${1:-data_Q1_2025}";

  time bin/1-download.sh "$data" || {
    echo "error: failed to download data." >&2;
    exit 1;
  }

  time bin/2-setup.php || {
    echo "error: failed to setup database." >&2;
    exit 1;
  }

  time bin/3-import.sh "$data" || {
    echo "error: failed to import data." >&2;
    exit 1;
  }

  time bin/4-clean.php || {
    echo "error: failed to clean data." >&2;
    exit 1;
  }

  time bin/5-materialize.php || {
    echo "error: failed to materialize views." >&2;
    exit 1;
  }

  echo "all steps completed successfully.";

}

main "$@";
