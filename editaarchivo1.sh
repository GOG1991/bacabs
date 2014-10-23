#!/bin/bash
#edita un archivo y lo redirecciona a otra carpeta
echo "iniciando........";
puto="perro 'bonito'";
echo "$puto";

#sed -e 's/n0hola/minganita/g' pruebas.txt > modificadoprueba.txt
#sed -e "s/n0hola/$puto/g" -e 's/perrad/esparqui/g' -e 's/de sepea lariata se esta queiensave que/esta apunto de acer erupcion/g' pruebas.txt > pruebatexto/modificadoprueba.txt
#buscar un archivo en un directorio
#find . -name "modificadoprueba.txt"
directorios=$(find . -name "modificadoprueba.txt");
echo "$directorios";
dire=$(dirname $directorios);
echo "$dire++++++++++++"
#echo "$dire";
#dire2=$(basename $directorios);
#echo "$dire2";
#sed -e "s/nombreuser=/nombreuser='puto el que lea'/g" pruebas.txt > pruebatexto/modificadoprueba.txt
#sed -n -e '/nombreuser=/p' pruebas.txt | more
res="$(sed -n -e '/nombreuser=/p' pruebas.txt | more)"
echo $res
sed -e "s:$res:nombreuser='home/cuatro':g" pruebas.txt > pruebatexto/modificadoprueba.txt
#sed -e "s/n0hola/$puto/g" pruebas.txt > pruebatexto/modificadoprueba.txt
#sed "s/pepe='torindo'/hola/g" pruebas.txt > pruebatexto/modificadoprueba.txt
#sed -e 's:/usr/local:/usr:g' pruebas.txt > pruebatexto/modificadoprueba.txt
#sed -e "s:pepito='/per/bash':pepito='/bin/bash':g" pruebas.txt > pruebatexto/modificadoprueba.txt

