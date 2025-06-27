#!/bin/bash

main() {

  set -euo pipefail;

  local file="$1";

  echo "downloading and extracting data for ${file}...";

  if [ ! -x "$( command -v wget )" ]; then

    echo "error: this script requires the 'wget' command to be installed." >&2;

    exit 1;

  fi

  if [ ! -x "$( command -v unzip )" ]; then

    echo "error: this script requires the 'unzip' command to be installed." >&2;

    exit 1;

  fi

  if [ "$( id -un )" != "mysql" ]; then

    echo "error: this script must be run as user 'mysql' not as '$( id -un )'." >&2

    exit 1;

  fi

  pushd /var/lib/mysql || {

    echo "error: failed to change directory to /var/lib/mysql" >&2;

    exit 1;

  }

  if [ ! -d backblaze ]; then

    mkdir backblaze || {

      echo "error: failed to make directory /var/lib/mysql/backblaze" >&2;

      exit 1;

    }

  fi

  pushd backblaze || {

    echo "error: failed to change directory to /var/lib/mysql/backblaze" >&2;

    exit 1;

  }

  download "$file";

  echo "done.";
  echo;

}

download() {

  local dir="$1";
  local file="$1.zip";
  local url="https://f001.backblazeb2.com/file/Backblaze-Hard-Drive-Data/${file}";

  if [ ! -f "${file}" ]; then

    echo "downloading ${file} from ${url}...";

    wget -q --show-progress "${url}" || {

      echo "error: failed to download ${file} from ${url}" >&2;

      exit 1;

    }

  else

    echo "file ${file} already exists, skipping download.";

  fi

  if [ ! -d "${dir}" ]; then

    echo "unzipping ${file}...";

    unzip -q "${file}" || {

      echo "error: failed to unzip ${file}" >&2;

      exit 1;

    }

  else

    echo "directory ${dir} already exists, skipping unzip.";

  fi

}

main "$@";
