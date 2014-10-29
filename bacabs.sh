#!/bin/bash
#pedir parametros
host='192.168.1.50';
nombre_usuario_directorio='aser_admin';

nombre_app='aser';
nombre_dir_app='aserprueba';#directorio que contine la app

nombre_user_bd='aser_adminbd';
passwd_userbd='JUvX8O08';
nombre_base_datos='aserdb080814';

direccion_gitremoto_app='https://github.com/GOG1991/aserprueba';

puerto_nginx='80';
vercion_python='3.4';

##################################
nombre_directorio_usuario="dir$nombre_usuario_directorio$nombre_app";
nombre_entorno_virtual="entorno$nombre_app";

###############################################
function Limpiar_D()
{
	
	rm -r -f config_r/*
	rm -r -f recurso_app/*
	rm -r -f config_app/*

}
function Limpiar_CrearD()
{
	mkdir -p config_r recurso_app config_app
	rm -r -f config_r/*
	rm -r -f recurso_app/*
	rm -r -f config_app/*

}
Limpiar_CrearD
###############################################
#modificar el archivo Cgunicor_statrt.sh y rediereccionarlo a carpeta config_r
echo " preparando script Cgunicor_statrt.sh para la configurarcion........";
function Mgunicor_statrt() 
{
	sed -e 's/n0app/'$1'/g' -e 's/n1cuser/'$2'/g' -e 's/n2nentor/'$3'/g' -e 's/n3ndapp/'$4'/g' -e 's/n4nuserd/'$5'/g' -e 's/n5nguserd/'$6'/g' recurso_config/Cgunicorn_start.sh > config_r/Cgunicorn_start.sh;
	echo "script Cgunicor_statrt.sh configurado........";
}
Mgunicor_statrt $nombre_app $nombre_directorio_usuario $nombre_entorno_virtual $nombre_dir_app $nombre_usuario_directorio $nombre_gurpo_usuario_directorio
#modificar el archivo CSapp.conf y rediereccionarlo a carpeta config_r
echo " preparando el archivo CSapp.conf para la configurarcion........";
function Mapp_conf()
{
	sed -e 's/n0app/'$1'/g' -e 's/n1cuser/'$2'/g' -e 's/n2nentor/'$3'/g' recurso_config/CSapp.conf > config_r/CS$nombre_app$nombre_usuario_directorio.conf;

	echo "Archivo CS$nombre_app$nombre_usuario_directorio.conf creado........";
}
Mapp_conf $nombre_app $nombre_directorio_usuario $nombre_entorno_virtual
#modificar el archivo CNapp.conf y rediereccionarlo a carpeta config_r
function MNapp_conf()
{
	echo " preparando el archivo CNapp.conf para la configurarcion........";
	sed -e 's/n0app/'$1'/g' -e 's/n1cuser/'$2'/g' -e 's/n2nentor/'$3'/g' -e 's/n6puerte/'$4'/g' -e 's/n7host/'$5'/g' recurso_config/CNapp.conf > config_r/CN$nombre_app$nombre_usuario_directorio.conf;

	echo "Archivo CN$nombre_app$nombre_usuario_directorio.conf creado........";
}
MNapp_conf $nombre_app $nombre_directorio_usuario $nombre_entorno_virtual $puerto_nginx $host
#clonar el repositorio de github
function ClonarR()
{
	echo "clonando el repositorio de github........";
	cd recurso_app/;
	git clone $1
	cd ..;
}
ClonarR $direccion_gitremoto_app
#localizar los archivos mamage.py,wsig.py,senttings.py, requirements.txt
directorios1=$(find . -name "manage.py");
echo "mamage.py esta en :$directorios1";
directorios2=$(find . -name "settings.py");
echo "senttings.py esta en :$directorios2";
directorios3=$(find . -name "requiriments.txt");
echo "requerimens.txt esta en :$directorios3";
directorios4=$(find . -name "wsgi.py");
echo "wsig.py esta en :$directorios4";
#optener las direcciones d elos archivos mamage.py,wsig.py,senttings.py,requerimens.txt
dire1=$(dirname $directorios1);
echo "$dire1";
dire2=$(dirname $directorios2);
echo "$dire2";
dire3=$(dirname $directorios3);
echo "$dire3";
dire4=$(dirname $directorios4);
echo "$dire4";
#modificar el fichero senttings.py y redirecionarlo a config_app
echo "	+++@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ←←↓↓↓↓→→@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ---";
echo "	+++@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ←←↓↓↓↓→→@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ---";
echo "	+++@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ←←↓↓↓↓→→@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ---";
echo "	+++@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ←←↓↓↓↓→→@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ---";
echo "	+++@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ←←↓↓↓↓→→@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ---";
echo "	+++@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ←←↓↓↓↓→→@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ---";
echo "	+++@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ←←↓↓↓↓→→@@@@@@łłłł€€€€€¶¶¶¶¶¶ŧŧŧ---";
echo " preparando el archivo settings.py para la configurarcion........";
#STATIC_ROOT
#MEDIA_ROOT
#STATIC_ROOT = '/home/ts05/entornoaser/static/' 
#MEDIA_ROOT = '/home/ts05/entornoaser/media/' 
staticroot=$(sed -n -e '/STATIC_ROOT/p' $directorios2);
echo $staticroot;
mediaroot=$(sed -n -e '/MEDIA_ROOT/p' $directorios2);
echo $mediaroot;
sed -e "s:$staticroot:STATIC_ROOT = '/home/$nombre_directorio_usuario/$nombre_entorno_virtual/static/':g" -e "s:$mediaroot:MEDIA_ROOT = '/home/$nombre_directorio_usuario/$nombre_entorno_virtual/static/':g" $directorios2 > config_app/settings.py;
echo "			.";
echo "			.";
echo "			.";
echo "			.";
echo "			.";
echo "			.";
#remplasar el archivo senttings.py de la app por el de config_app
echo "$directorios2............";
dire=$(dirname $directorios2);
rm $directorios2;
#mv config_app/settings.py $directorios2
cp config_app/settings.py $dire;
#empaquetar la carpeta recurso_app, config_r, bacabsser.sh
echo "Archivo settings.py configurado........";
#enviar el paquete al vps en el directorio/contenedor del usuario via ssh
#descomprimir el paquete  via ssh
#ejecutar bacabsser.sh via ssh
#limpiar las carpetas recurso_app, config_app, config_r
#rm -r -f mi_directorio la -f para que no pida confirmacion
echo "limpiado drectorios config_r, recurso_app, y config_app........";
#revizar el directorio donde esta ubicado antes de borara
#rm -r -f config_r/*
#rm -r -f recurso_app/*
#rm -r -f config_app/*
#mkdir recurso_app
#aqui termina la funcion en el cliente y comiensa lo del servidor
#actualiza el sistema
#intala las depedencias y crea los enlaces necesarios
#instala los servicios necesarios
#crea la base de datos y su usuario
#crea el entorno virtual con su vercion de python
#se activa el entorno virtual y se mueve la app dentro de la carpeta del entorno 
#se activa el entor virtual y se instalan los requrimens.txt
#--------------------------
#se crean los directorios necesarios si no estan primero se buscan
#se crean los archivos nesezarios dentro de los directorios
#se mueven los archivos de config_r a su lugar
#se activan los servicios nesesarios y se configuran se reinician
#se eliminan los archivos que se puedan de contenedor
#reiniciar el servidor 





