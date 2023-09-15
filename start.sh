#!/bin/sh

# pass -d to this script to start the container in the background

RED='\033[0;31m'
NC='\033[0m' # No Color

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FILE="$SCRIPT_DIR/.env.dev"
if [ ! -f "$FILE" ]; then
    printf "Algolia file ${RED}.env.dev${NC} missing!\nTo setup: ${RED}echo ALGOLIA_API_KEY=[my_api_key] > .env.dev${NC}\n"
	exit
fi

docker-compose up $@
