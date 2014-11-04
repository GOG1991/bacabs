#!/bin/bash
echo "........................"
cd /home/nombre_directorio_usuario/nombre_entorno_virtual
echo "........................"
source bin/activate
echo "........................"
#*********************************************************
#sincornisar bd
python /home/nombre_directorio_usuario/nombre_entorno_virtual/nombre_dir_app/manage.py syncdb
#migrar bases de datos
python /home/nombre_directorio_usuario/nombre_entorno_virtual/nombre_dir_app/manage.py migrate --fake
echo "intruduce Ctrl + c para continuar..............x";
cd /home/nombre_directorio_usuario/nombre_entorno_virtual/nombre_dir_app
gunicorn nombre_app.wsgi:application -b hostx:8040
echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
deactivate

