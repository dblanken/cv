#!/bin/bash

to_html() {
  ruby cv.rb "$@" --role software_engineer
}

to_html $@
