#!/bin/bash

to_pdf() {
  ./markdown.sh "$@" | pandoc -t pdf -o -
}

to_pdf $@
