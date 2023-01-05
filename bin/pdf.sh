#!/bin/bash

to_pdf() {
  ./bin/markdown.sh "$@" | pandoc -t pdf -o -
}

to_pdf $@
