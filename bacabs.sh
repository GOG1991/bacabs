#!/bin/bash
#script para realizar dployd

####################
#######################################

#variables
host='';
nombre_usuario_directorio='';
nombre_app='';
nombre_dir_app='';
nombre_user_bd='';
passwd_userbd='';
nombre_base_datos='';
direccion_gitremoto_app='';
puerto_nginx='';
vercion_python='';
manage='manage.py';
settings='settings.py';
requirements='requirements.txt';
wsgi='wsgi.py';
Ldirectorio='';
Adirectorio='';

###FUNCIONES
function Limpiar_D()
{
	clear
	rm -r -f config_r/*
	rm -r -f recurso_app/*
	rm -r -f config_app/*

}
function Exit()
{
	if read -t 10 -p "Corrija correctamente su aplicacion para continuar con el proceso ..........  " 
	then
		Limpiar_D
		exit
	else
		Limpiar_D
		exit
	fi
}
function Limpiar_CrearD()
{
	clear
	mkdir -p config_r recurso_app config_app
	rm -r -f config_r/*
	rm -r -f recurso_app/*
	rm -r -f config_app/*

}
function Mgunicor_statrt() 
{
	echo " preparando script Cgunicor_statrt.sh para la configurarcion........";
	sed -e 's/n0app/'$1'/g' -e 's/n1cuser/'$2'/g' -e 's/n2nentor/'$3'/g' -e 's/n3ndapp/'$4'/g' -e 's/n4nuserd/'$5'/g' -e 's/n5nguserd/'$6'/g' recurso_config/Cgunicorn_start.sh > config_r/Cgunicorn_start.sh;
	echo "script Cgunicor_statrt.sh configurado........";
}

function Mapp_conf()
{
	echo " preparando el archivo CSapp.conf para la configurarcion........";
	sed -e 's/n0app/'$1'/g' -e 's/n1cuser/'$2'/g' -e 's/n2nentor/'$3'/g' recurso_config/CSapp.conf > config_r/CS$nombre_app$nombre_usuario_directorio.conf;

	echo "Archivo CS$nombre_app$nombre_usuario_directorio.conf creado........";
}
function MNapp_conf()
{
	echo " preparando el archivo CNapp.conf para la configurarcion........";
	sed -e 's/n0app/'$1'/g' -e 's/n1cuser/'$2'/g' -e 's/n2nentor/'$3'/g' -e 's/n6puerte/'$4'/g' -e 's/n7host/'$5'/g' recurso_config/CNapp.conf > config_r/CN$nombre_app$nombre_usuario_directorio.conf;

	echo "Archivo CN$nombre_app$nombre_usuario_directorio.conf creado........";
}

function ClonarR()
{
	echo "clonando el repositorio........";
	cd recurso_app/;
	git clone $1
	if [ "$?" -ne "0" ]
	then 
		
		echo "la ruta del repositorio remoto no se encuentra o esta mal escrita........";
		#puede volver a pedir la direccion atra ves		
		#Exit
		echo "volver a introducir la dirección o presionar Ctrl + c para salir de la instalación ........";	
		PRM
		ClonarR $direccion_gitremoto_app
	else 
		echo "El repositorio se clono correctamente........" ;
	fi
	cd ..;
}

function Localisar()
{
	
	Ldirectorio=$(find . -name $1 );
	
	if [ "$Ldirectorio" != "" ]
	then 
		
		echo "Archivo localisado, se encuentra en el directorio $Ldirectorio"
			
	else 
		echo "El uarchivo $nombre_archivo no existe en el directorio" ;
		Exit 
	fi

}
function ObtenerD()
{
	Adirectorio=$(dirname $1);
	if [ "$Adirectorio" != "" ]
	then 
		
		echo "la Ruta del archivo es $Adirectorio";
			
	else 
		echo "El uarchivo $nombre_archivo no existe en el directorio" ;
		Exit 
	fi	
}
function Rsenttings_py()
{
	
	userdb=$(sed -n -e "/$nombre_user_bd/p" $loc_settings);
	if [ "$userdb" != "" ]
	then 
		
		echo "el usuario de la base de datos $nombre_user_bd coincide con el del archivo senttings........";
			
	else 
		echo "El usuario $nombre_base_datos no coincide en el archivo settings de tu aplicasion........" ;
		#Exit 
	fi
	nomdb=$(sed -n -e "/$nombre_base_datos/p" $loc_settings);
	if [ "$nomdb" != "" ]
	then 
		
		echo "el nombre de la base de datos $nombre_base_datos coincide con el del archivo senttings........";
			
	else 
		echo "El nombre de la base de datos $nombre_base_datos no coincide en el archivo settings de tu aplicasion........" ;
		#Exit 
	fi

	passdb=$(sed -n -e "/$passwd_userbd/p" $loc_settings);
	if [ "$passdb" != "" ]
	then 
		
		echo "el passwd de la base de datos coincide con el del archivo senttings........";
			
	else 
		echo "El passwd de la base de datos no coincide en el archivo settings de tu aplicasion........" ;
		#Exit 
	fi
	
}
function Msenttings_py()
{
	echo " preparando el archivo settings.py para la configurarcion........";
 
	staticroot=$(sed -n -e '/STATIC_ROOT/p' $loc_settings);
	echo $staticroot;
	mediaroot=$(sed -n -e '/MEDIA_ROOT/p' $loc_settings);
	echo $mediaroot;
	sed -e "s:$staticroot:STATIC_ROOT = '/home/$nombre_directorio_usuario/$nombre_entorno_virtual/static/':g" -e "s:$mediaroot:MEDIA_ROOT = '/home/$nombre_directorio_usuario/$nombre_entorno_virtual/static/':g" $loc_settings > config_app/settings.py;
	echo "Archivo settings.py configurado........";
}
######################################


#pedir parametros
#limpiar................
Limpiar_CrearD

function PIP()
{
	read -p "dame la ip del servidor: " host;
	#host='192.168.1.50';
	ssh root@$host -p22 echo "conectando........";
	if (( "$?" != "0" ))
	then
		echo "la conexion fallo, asegurate de introducir la IP del servidor correcta,  preciona Ctrl + c para salir........";
	PIP
	else
		echo "conexion realizada exitosa mente........";
	fi
}
#pedir ip
PIP
#clonar el repositorio remoto
function PRM()
{
	read -p "Introduce la direccion del repositorio remoto: " direccion_gitremoto_app;
direccion_gitremoto_app='https://github.com/GOG1991/aserprueba';
}
PRM
ClonarR $direccion_gitremoto_app
#localizar los archivos y rutas
Localisar $manage
Localisar $settings
ObtenerD $Ldirectorio
loc_settings=$Ldirectorio;
ruta_settings=$Adirectorio;
Localisar $requirements
ObtenerD $Ldirectorio
ruta_requirements=$Adirectorio;
Localisar $wsgi
#pedir nombre de la appp
function Nomapp()
{
	read -p "Dame el nombre de la app: " nombre_app;
	 nombre_dir_app=$(ls recurso_app/);
	echo "Directorio base de la app: $nombre_dir_app";
	Appdirectorio=$(find . -name $nombre_app );
	if [ "$Appdirectorio" != "" ]
	then 
		
		echo "Nombre localisado, se encuentra en el directorio $Appdirectorio............"
			
	else 
		echo "El Nombre $nombre_app de la alicasion no conincide. asegurese de que la aplicacion contenga la estrutura requerida........";
		Exit 
	fi
	nombre_entorno_virtual="entorno$nombre_app";
	echo "el entrono virtual se llamara: $nombre_entorno_virtual"; 
}
Nomapp
##################
function PideNUseryApp()
{
	read -p "Dame el nombre del Usuario para la aplicasion: " nombre_usuario_directorio;
	#nombre_usuario_directorio='aser_admin';
	
}
function CreaUserDir()
{
	
	nombre_directorio_usuario="dir$nombre_usuario_directorio$nombre_app";
	
	ssh root@$host -P22 useradd -d /home/$nombre_directorio_usuario -m -s /sbin/nologin $nombre_usuario_directorio
	if [ "$?" -ne "0" ]
	then 
		echo "el usuario $nombre_usuario_directorio ya existe dame otro nombre, introduce Ctrl +c para salir";
		PideNUseryApp
		CreaUserDir 	
	else 
		echo "El usuario $nombre_usuario_directorio se creo correctamente........" ;
	fi

}

#pide usuario de app
PideNUseryApp
#crea usuario de app
CreaUserDir 





nombre_dir_app='aserprueba';#directorio que contine la app
read -p "Dame el nombre del usuario de la base de datos: " nombre_user_bd;
nombre_user_bd='aser_adminbd2';
read -p "dame el passwd del usuario de la base de datos: " passwd_userbd;
passwd_userbd='JUvX8O08';
read -p "dame el nobre de la base de datos: " nombre_base_datos;
nombre_base_datos='aserdb080814';

read -p "Dame el puerto por el cual escucha Nginx: " puerto_nginx;
puerto_nginx='80';
read -p "Dame el numero de la vercion de Python pudeser 2.7, 3.0, 3.4 : " vercion_python;
vercion_python='3.4';


#ssh $userservidor@$dominio -p$puerto 'apt-get update'
###############################################
#modificar el archivo Cgunicor_statrt.sh y rediereccionarlo a carpeta config_r
Mgunicor_statrt $nombre_app $nombre_directorio_usuario $nombre_entorno_virtual $nombre_dir_app $nombre_usuario_directorio $nombre_gurpo_usuario_directorio
#modificar el archivo CSapp.conf y rediereccionarlo a carpeta config_r
Mapp_conf $nombre_app $nombre_directorio_usuario $nombre_entorno_virtual
#modificar el archivo CNapp.conf y rediereccionarlo a carpeta config_r
MNapp_conf $nombre_app $nombre_directorio_usuario $nombre_entorno_virtual $puerto_nginx $host

#revisar que el archivo senttings 
Rsenttings_py
#modificar el fichero senttings.py y redirecionarlo a config_app
Msenttings_py
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





