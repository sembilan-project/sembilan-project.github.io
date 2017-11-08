#!/usr/bin/env bash

removeGeneratedFiles() {
  echo "===Removing generated files"
  find .. -name code -prune \
    -o -name .git -type d -prune \
    -o -name .gitignore -type f -prune \
    -o -name *.iml -type f -prune \
    -o -type f -exec rm {} +
}

copyGeneratedFiles() {
  echo "===Copying generated files"
  rsync -a dist/ ..
}

build() {
  removeGeneratedFiles
  copyGeneratedFiles
}

build
