#!/bin/bash

arrayRec=('6WH4' '6WHA' '7VOD' '7WC6' '7WC7' '7WC8' '7WC9')
arrayGrid=('23.292,-36.425,52.180' '98.126,106.210,94.142' '-29.182,-12.892,141.485' \
	'-27.306,-11.351,142.636' '-27.440,-11.246,142.573' '-28.201,-12.863,143.165' \
	'-28.651,-12.951,143.399')

arrayGlobal=('6WH4_23.292,-36.425,52.180' '6WHA_98.126,106.210,94.142' '7VOD_-29.182,-12.892,141.485' \
	'7WC6_-27.306,-11.351,142.636' '7WC7_-27.440,-11.246,142.573' '7WC8_-28.201,-12.863,143.165' \
	'7WC9_-28.651,-12.951,143.399')

nav=$(pwd)
py="/usr/local/MGLTools-1.5.6/bin/pythonsh"


if [ -e "${nav}/prepare_dpf42.py" ]; then
	for i in ${arrayGlobal[@]};do
		
		nameRec=`echo ${i} | cut -d'_' -f1`
		gridCenter=`echo ${i} | cut -d'_' -f2`
		
		#echo $nameRec $gridCenter
		
		if [ -e "${nav}/${nameRec}_EUG/${nameRec}_flex.pdbqt" ] ; then
			
			cd ${nav}/${nameRec}_EUG/
			$py ../prepare_dpf42.py -l EUG_opt.pdbqt -r ${nameRec}_rigid.pdbqt -p flexres=${nameRec}_flex.pdbqt -p set_ga=lga -p ga_num_evals=10000000 -p ga_pop_size=300 -p ga_run=100 -o ${nameRec}_docking.dpf
			cd ${nav}
		
		else
			echo "O arquivo ${nav}/${nameRec}_EUG/${nameRec}.pdbqt não foi encontrado"
		fi

	done
else 
	echo "Verifique se o arquivo 'prepare_flexreceptor4.py' está na no diretorio ${nav}"
	break
fi
