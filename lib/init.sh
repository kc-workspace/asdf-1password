#!/usr/bin/env bash

## User init functions
## This will load on very beginning of the scripts
## so make sure that you only define functions

_kc_asdf_custom_tags() {
  curl -sSL 'https://app-updates.agilebits.com/product_history/CLI2' |
    grep -oE 'v[0-9.a-z-]*\.pkg' |
    sed 's/.pkg//'
}

_kc_asdf_custom_arch() {
  local arch="$1"
  kc_asdf_is_darwin &&
    arch="universal"
  printf '%s' "$arch"
}

_kc_asdf_custom_enabled_features() {
  local feature="$1"
  ## GPG are not support on MacOS
  kc_asdf_is_darwin &&
    [[ "$feature" == "gpg" ]] &&
    return 1

  return 0
}
