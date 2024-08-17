#!/bin/bash

arrayRec=('6WH4' '6WHA' '7VOD' '7WC6' '7WC7' '7WC8' '7WC9')

for i in ${arrayRec[@]}; do
			
		#cp ./${i}/${i}.pdbqt ./${i}_EUG/
		#echo "cp ./${i}/${i}.pdbqt ./${i}_EUG/"
		
		echo "./${i}_EUG/${i}_docking.dpf"
done
