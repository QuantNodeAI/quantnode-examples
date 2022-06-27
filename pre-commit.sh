#!/bin/bash

# create file_structure file in the pre-commit and add it to that commit
tree . -J --noreport > file_structure.json && git add file_structure.json
