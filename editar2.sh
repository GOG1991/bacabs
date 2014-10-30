#!/bin/bash
#editar textos de un archivo
x0="django.db.backends.postgresql_psycopg2";
x1="aserdb080814xxx"
x2="aser_adminbd2xxx"
x3="JUvX8O08xxx"
x4="localhost"
xx1="NAME': 'aserdb080814',
sed -e "s:'NAME':$x1
sed -e "s:$staticroot:$catr:g"  pruebas.txt > pruebatexto/modificadoprueba3.txt;
'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'aserdb080814',
        'USER':'aser_adminbd2',
        'PASSWORD':'JUvX8O08',
        'HOST': 'localhost',

sed -e "s:$staticroot:STATIC_ROOT = '/home/$nombre_directorio_usuario/$nombre_entorno_virtual/static/':g" -e "s:$mediaroot:MEDIA_ROOT = '/home/$nombre_directorio_usuario/$nombre_entorno_virtual/static/':g" $loc_settings > config_app/settings.py;
#sed -n -e '/PRINCIPIO/,/FIN/p' /mi/archivo/de/pruebas
#cat  NAME | grep Nuñez >> salidaNuñez.txt
# sed '2,4 d' archivo > archivo2.txt
#sed -e 's:/usr/local:/usr:g' pruebas.txt > pruebatexto/modificadoprueba.txt
#staticroot=$(sed -n -e '/STATIC_ROOT/p' $loc_settings);
#echo $staticroot;
#mediaroot=$(sed -n -e '/MEDIA_ROOT/p' $loc_settings);
#echo $mediaroot;
#sed -e "s:$staticroot:STATIC_ROOT = '/home/$nombre_directorio_usuario/$nombre_entorno_virtual/static/':g" -e "s:$mediaroot:MEDIA_ROOT = '/home/$nombre_directorio_usuario/$nombre_entorno_virtual/static/':g" $loc_settings > config_app/settings.py;

