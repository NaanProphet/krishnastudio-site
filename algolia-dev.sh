#!/bin/sh

# ALGOLIA_API_KEY env var is assumed
bundle exec jekyll algolia --config _config.yml,_config-dev.yml
