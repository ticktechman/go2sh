#!/usr/bin/env bash
###############################################################################
##
##       filename: svg2icns.sh
##    description: convert svg to icns
##        created: 2023/10/02
##         author: ticktechman
##
###############################################################################

## deps: brew install svg2png
function svg2icns() {
  [[ $# -le 0 ]] && {
    echo "usage: svg2icns <svg-file1> ..."
    return 0
  }

  declare -a icns_sizes=(16 32 64 128 256 512)
  for one in "$@"; do
    echo "$one"
    local name="${one%.svg}"
    local iconset=".svg2icns/${name}.iconset"
    local icns=".svg2icns/${name}.icns"
    rm -rf ".svg2icns" && mkdir -p "$iconset"
    for sz in ${icns_sizes[@]}; do
      svg2png -w "$sz" -h "$sz" "$one" "${iconset}/icon_${sz}x${sz}.png"
    done
    iconutil -c icns -o "$icns" "${iconset}"
    mv "$icns" ./
  done
  rm -rf ".svg2icns"
}

###############################################################################
