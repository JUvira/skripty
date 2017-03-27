#!/bin/bash
function check {
a=`echo $path | awk -F "." '{print $2}' | awk -F " " '{print $1}'`
if [[ $a == "jpg" ]] || [[ $a == "png" ]] || [[ $a == "JPG" ]] || [[ $a == "PNG" ]] || [[ $a == "*" ]]; then
valid=1
else
valid=0
echo "Spatny typ souboru!"
fi
return $valid
}

function ending {
if [[ $choice == 1 ]]; then
end="jpg"
elif [[ $choice == 2 ]]; then
end="png"
fi
npath=`echo $path | awk -F "." '{print $1}'`
if [[ $choice == 1 ]]; then
convert $path $npath.jpg
elif [[ $choice == 2 ]]; then
convert $path $npath.png
fi
return
}

function formatCheck {
a=`echo $path | awk -F "." '{print $2}' | awk -F " " '{print $1}'`
if [ $choice == 1 ]; then
	if [[ $a == "png" ]] || [[ $a == "PNG" ]]; then
	valid=1
	else
	valid=0
	echo "Spatny typ souboru"
	fi
elif [ $choice == 2 ]; then
	if [[ $a == "jpg" ]] || [[ $a == "JPG" ]]; then
        valid=1
        else
        valid=0
        echo "Spatny typ souboru"
	fi
fi
return $valid
}

choice=55
until [ $choice == e ]; do
	valid=2
	echo "_______________________Vyber si co by sis pral___________________________"
	echo "*************************************************************************"
	echo "*									      *"
	echo "* (1) Zmenit rozliseni						      *"
	echo "* (2) Pouziti efektu						      *"
	echo "* (3) Prekonvertovat						      *"
	echo "* (4) Otocit							      *"
	echo "* (5) Zmenit kvalitu						      *"
	echo "*************************************************************************"
	echo "* (e) Odejit							      *"
	echo "*************************************************************************"
	echo "Vybral sis: "
	read choice
	clear
	if [ $choice == 1 ]; then
		echo "Rozliseni"
		until [ $valid == 1 ]; do
		echo "Napis cestku k obrazku (jestli chces zmenit vsechny obrazky, napis *.[format]): "
		read path
		check
		done
		echo "Zadej nove rozliseni: "
		read resolution
		convert $path -resize $resolution $path
		echo "Rozliseni obrazku se uspesne zmenilo!"
	elif [ $choice == 2 ]; then
		echo "***********************************"
		echo "*		Vyber efektu		*"
		echo "*					*"
		echo "*	(c) Charcoal			*"
		echo "* (i) Implosion			*"
		echo "***********************************"
		echo "Vyber si: "
		read choice
		until [ $valid == 1 ]; do
		echo "Napis cestku k obrazku (jestli chces zmenit vsechny obrazky, napis *.[format]): "
		read path
		check
		done
		if [ $choice == c ]; then
			echo "Zadej velikost charcoal efektu: "
			read strength
			convert $path -charcoal $strength $path
			echo "Charcoal efekt aplikovan!"
		elif [ $choice == i ]; then
			echo "Zadej velikost implosion efektu: "
			read strength
			convert $path -implode $strength $path
			echo "Implosion (cerna dira) efekt aplikovan!"
		fi
	elif [ $choice == 3 ]; then
		echo "Format MENU"
		echo "(1) png -> jpg"
		echo "(2) jpg -> png"
		echo "--------------"
		read choice
		until [ $valid == 1 ]; do
		echo "Napis cestku k obrazku (jestli chces zmenit vsechny obrazky, napis *.[format]): "
		read path
		formatCheck
		done
		ending
		echo "Obrazek konvertovan!"
	elif [ $choice == 4 ]; then
		echo "OTOC"
		until [ $valid == 1 ]; do
		echo "Napis cestku k obrazku (jestli chces zmenit vsechny obrazky, napis *.[format]): "
		read path
		check
		done
		echo "Zadej cislo stupne k otoceni obrazku: "
		read rotate
		convert $path -rotate $rotate $path
		echo "Obrazek uspesne otocen"
	elif [ $choice == 5 ]; then
		echo "Kvalita"
		until [ $valid == 1 ]; do
		echo "Napis cestku k obrazku (jestli chces zmenit vsechny obrazky, napis *.[format]): "
		read path
		check
		done
		echo "Zadej kvalitu obrazku: "
		read quality
		convert $path -quality $quality $path
		echo "Kvalita zmenena"
	fi
done
