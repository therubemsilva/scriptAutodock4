#!/bin/bash


arrayRec=('6WH4' '6WHA' '7VOD' '7WC6' '7WC7' '7WC8' '7WC9')

nav=$(pwd)

if [ -e "${nav}/autodock4" ]; then
	for i in ${arrayRec[@]}; do
		if [ -e "${nav}/${i}_EUG/${i}_docking.dpf" ] ; then
			
			cd ${nav}/${i}_EUG/
			../autodock4 -p ${i}_docking.dpf -l ${i}_docking.dlg
			cd ${nav}
		
		else
			echo "O arquivo ${nav}/${i}_EUG/${i}_EUG.dpf não foi encontrado"
		fi

	done
else 
	echo "Verifique se o arquivo 'autodock4' está na no diretorio ${nav}"
	break
fi
