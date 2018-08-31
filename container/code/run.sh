#!/bin/sh

set -e

if [ -d "tmp" ]; then
	python3 tmp/jupyter_conf.py ${BASE_URL} ${PASSWORD}
	rm -rf tmp
fi

jupyter notebook --allow-root
