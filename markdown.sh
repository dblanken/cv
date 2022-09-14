#!/bin/bash

to_markdown() {
  ruby cv.rb "$@" --role software_engineer_markdown --type md
}

to_markdown $@
