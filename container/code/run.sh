#!/bin/sh

set -e

if [ -d "tmp" ]; then
	python3 tmp/jupyter_conf.py ${PASSWORD} ${BASE_URL}
	rm -rf tmp
fi

jupyter notebook --allow-root
