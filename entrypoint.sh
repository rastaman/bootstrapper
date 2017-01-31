#!/bin/sh
ROOT=/srv/bootstrapper
cd $ROOT
if [ "${BOOTSTRAPPER_SERVER:-no}" = "yes" ]; then
	gunicorn -b '0.0.0.0:8000' bootstrap:app
else
	python worker.py
fi
