#!/bin/bash


arrayRec=('6WH4' '6WHA' '7VOD' '7WC6' '7WC7' '7WC8' '7WC9')

nav=$(pwd)

if [ -e "${nav}/autogrid4" ]; then
	for i in ${arrayRec[@]}; do
		if [ -e "${nav}/${i}_EUG/${i}_rigid.gpf" ] ; then
			
			cd ${nav}/${i}_EUG/
			../autogrid4 -p ${i}_rigid.gpf -l ${i}_docking.glg
			cd ${nav}
		
		else
			echo "O arquivo ${nav}/${i}_EUG/${i}_EUG.gpf não foi encontrado"
		fi

	done
else 
	echo "Verifique se o arquivo 'autogrid4' está na no diretorio ${nav}"
	break
fi
