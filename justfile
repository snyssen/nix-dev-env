default:
  just --list

# Initial setup for entire repository
setup: setup-pre-commit

# Setup pre-commit hooks
setup-pre-commit:
  pre-commit install

# TODO: add build/test/etc. commands
