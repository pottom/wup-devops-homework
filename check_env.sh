#!/bin/sh
if [ -z "$ENV_VAR_1" ]; then 
    echo "ENV_VAR_1 is not set" >&2
fi

if [ -z "$ENV_VAR_2" ]; then 
    echo "ENV_VAR_2 is not set" >&2
fi