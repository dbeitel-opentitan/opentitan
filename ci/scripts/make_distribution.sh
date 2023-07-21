#!/bin/bash
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

set -e

# make_distribution.sh takes distribution artifacts in $BIN_DIR and packs them
# into a compressed TAR archive, which is deposited into $BIN_DIR. In
# particular, this script should be run after make_build_bin.sh.
#
# The actual artifacts exported are described by the $DIST_ARTIFACTS variable
# below.

. util/build_consts.sh

echo "\$OT_VERSION = $OT_VERSION" >&2

# $DIST_ARTIFACTS is a list of |find| globs to be copied out of
# $BIN_DIR and into the OpenTitan distribution archive.
#
# These globs are relative to $BIN_DIR.
readonly DIST_ARTIFACTS=(
  'sw/device/*.elf'
  'sw/device/*.bin'
  'sw/device/*.vmem'
  'hw/top_darjeeling/lowrisc_systems_chip_darjeeling_*.bit.*'
  'hw/top_darjeeling/*.mmi'
  'hw/top_earlgrey/Vchip_earlgrey_verilator'
  'hw/top_earlgrey/chip_earlgrey_cw310/*'
)

DIST_DIR="$OBJ_DIR/$OT_VERSION"
mkdir -p "$DIST_DIR"

cp ci/README.snapshot "$DIST_DIR"
cp LICENSE "$DIST_DIR"

for pat in "${DIST_ARTIFACTS[@]}"; do
  echo "Searching for $pat." >&2
  found_file=false
  # Looping over find output is a problem if our file paths have glob
  # characters or spaces.  However, we do not have filenames like that in CI,
  # and the alternative formulations of this for loop are less intuitive.

  # shellcheck disable=SC2044
  for file in $(find "$BIN_DIR" -type f -path "$BIN_DIR/$pat"); do
    found_file=true
    relative_file="${file#"$BIN_DIR/"}"
    echo "Copying \$BIN_DIR/$relative_file." >&2

    destination="$DIST_DIR/$(dirname "$relative_file")"
    mkdir -p "$destination"
    mv "$file" "$destination"
  done
  if [[ "$found_file" == "false" ]]; then
    echo "Did not find any files matching $pat." >&2
    echo "If this is intentional, delete that pattern." >&2
    exit 1
  fi
done

cd "$(dirname "$DIST_DIR")"
tar -cJf "$BIN_DIR/$(basename "$DIST_DIR").tar.xz" \
  "$(basename "$DIST_DIR")"
