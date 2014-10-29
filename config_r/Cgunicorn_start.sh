#!/bin/bash 
	NAME="aser" # Nombre de la aplicación 
	DJANGODIR=/home/diraser_adminaser/entornoaser/aserprueba # Ubicación de donde esta tu proyecto django 
	SOCKFILE=/home/diraser_adminaser/entornoaser/run/gunicorn.sock # Nos comunicaremos usando unix socket 
	USER=root # Usuario del directorio donde esta la app
	GROUP=root # El grupo al que pertenece 
	NUM_WORKERS=3 # Cuantos procesos debería trabajar Gunicorn spawn 
	DJANGO_SETTINGS_MODULE=aser.settings # El archivo de configuración donde esta 
	DJANGO_WSGI_MODULE=aser.wsgi # WSGI module name 

	# Activamos el entorno virtual 
	cd $DJANGODIR 
	source ../bin/activate 
	export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE 
	export PYTHONPATH=$DJANGODIR:$PYTHONPATH 

	# Creando el directorio run si por casualidad no existe. 
	RUNDIR=$(dirname $SOCKFILE) 
	echo "dirname tiene: $RUNDIR" 
	test -d $RUNDIR || mkdir -p $RUNDIR 
	exec ../bin/gunicorn ${DJANGO_WSGI_MODULE}:application \ 
	--name $NAME \ 
	--workers $NUM_WORKERS \ 
	--user=$USER --group=$GROUP \ 
	--log-level=debug \ 
	--bind=unix:$SOCKFILE
