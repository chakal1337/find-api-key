#!/bin/bash
assetfinder -subs-only $1 | sort -u | uniq | httprobe -c 100 | tee probed.txt;
mkdir alljs;
cd alljs;
cat ../probed.txt | xargs -L 1 -P 5 wget -A js -r;
grep -rEo '.{0,100}API.{0,100}' *;
