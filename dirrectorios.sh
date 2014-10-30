#!/bin/bash
#localizar los archivos 
nombre_archivo='mandar.py';
directorio="";
Ldirectorio='';
Adirectorio='';
#mandar.py
function Exit()
{
	if read -t 10 -p "Corrija correctamente su aplicacion para continuar con el proceso ..........  " 
	then
		exit
	else
		exit
	fi
}
#funcion para localizar archivos
function Localisar()
{
	
	Ldirectorio=$(find . -name $1 );
	
	if [ "$Ldirectorio" != "" ]
	then 
		
		echo "el archivo se encuentra en el directorio: $Ldirectorio"
			
	else 
		echo "El uarchivo $nombre_archivo no existe en el directorio" ;
		Exit 
	fi

}
Localisar $nombre_archivo

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
ObtenerD $Ldirectorio
dir_archivo=$Adirectorio;
echo "direccion archivo: $dir_archivo"; 
dirr='https://github.com/GOG1991/aserprueba';
function Clonar_R()
{
	cd pruebatexto/	
	git clone $dirr
	if [ "$?" -ne "0" ]
	then 
		
		echo "la ruta del repositorio remoto no se encuentra o esta mal escrita........";
		#puede volver a pedir la direccion atra ves		
		Exit	
	else 
		echo "El repositorio se clono correctamente........" ;
	fi
	cd ..	
}
Clonar_R
echo "dale a tu cuerpo alegria y makarena.............";
echo "dale a tu cuerpo alegria y makarena.............";
echo "dale a tu cuerpo alegria y makarena.............";
echo "dale a tu cuerpo alegria y makarena.............";
echo "dale a tu cuerpo alegria y makarena.............";
echo "dale a tu cuerpo alegria y makarena.............";
echo "dale a tu cuerpo alegria y makarena.............";

#directorios1=$(find . -name $nombre_archivo);
#echo "mamage.py esta en :$directorios1";
#directorios2=$(find . -name "settings.py");
#echo "senttings.py esta en :$directorios2";
#directorios3=$(find . -name "requirements.txt");
#echo "requerimens.txt esta en :$directorios3";
#directorios4=$(find . -name "wsgi.py");
#echo "wsig.py esta en :$directorios4";
#optener las direcciones d elos archivos mamage.py,wsig.py,senttings.py,requerimens.txt
#dire1=$(dirname $directorios1);
#echo "$dire1";
#dire2=$(dirname $directorios2);
#echo "$dire2";
#dire3=$(dirname $directorios3);
#echo "$dire3";
#dire4=$(dirname $directorios4);
#echo "$dire4";
