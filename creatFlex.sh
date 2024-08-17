#!/bin/bash

arrayRec=('6WH4' '6WHA' '7VOD' '7WC6' '7WC7' '7WC8' '7WC9')

nav=$(pwd)

py="/usr/local/MGLTools-1.5.6/bin/pythonsh"


if [ -e "${nav}/prepare_flexreceptor4.py" ]; then
	for i in ${arrayRec[@]}; do
		if [ -e "${nav}/${i}_EUG/${i}.pdbqt" ] ; then
			
			cd ${nav}/${i}_EUG/
			$py ../prepare_flexreceptor4.py -r ${i}.pdbqt -s TRP151_ILE152_ASP155_VAL156_SER159_LEU228_LEU229_SER239_TRP336_PHE339_PHE340_ASN343_VAL366_TYR370 -x ${i}_flex.pdbqt
			cd ${nav}
		
		else
			echo "O arquivo ${nav}/${i}_EUG/${i}.pdbqt não foi encontrado"
		fi

	done
else 
	echo "Verifique se o arquivo 'prepare_flexreceptor4.py' está na no diretorio ${nav}"
	break
fi
