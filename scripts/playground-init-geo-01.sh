#!/bin/bash

./playground-clean-classroom-geo.sh

~/.tiup/bin/tiup playground v6.1.1 --tag classroom-geo --db 2 --pd 3 --kv 1 --tiflash 1 --kv.config ./misc/label-geo-shanghai-ssd.toml
