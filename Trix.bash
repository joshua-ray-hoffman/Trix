#!/bin/bash
#    ____________________________________________________________________________________________________
#   |* ___________________________________________GPL-3_Licence________________________________________ *|
#   | /                                                                                                \ |
#   | |         This program is free software: you can redistribute it and/or modify                   | |
#   | |         it under the terms of the GNU General Public License as published by                   | |
#   | |         the Free Software Foundation, either version 3 of the License, or                      | |
#   | |         (at your option) any later version.                                                    | |
#   | |                                                                                                | |
#   | |         This program is distributed in the hope that it will be useful,                        | |
#   | |         but WITHOUT ANY WARRANTY; without even the implied warranty of                         | |
#   | |         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                          | |
#   | |         GNU General Public License for more details.                                           | |
#   | |                                                                                                | |
#   | |         You should have received a copy of the GNU General Public License                      | |
#   | |         along with this program.  If not, see <http://www.gnu.org/licenses/>.                  | |
#   | |                                                                                                | |
#   | \________________________________________________________________________________________________/ |
#https://pastebin.com/gdUYBtQb

B=$1

Trix () {

N=$@
unset

A=( 0 0 0 {1..10} 25 50 100 1024 {a..z} exit )

	if [[ 1 = 1 ]]; then
	C=( $(awk -F'\}' '/\(\)/ && !/awk/ && !/Trix/ {print $0"\n"}' $0 | tr -d [:blank:],\(,\),\{) )
	else
	C=( D )
	fi
	
	for E in ${C[@]}; do
	declare -A Fd
	((G++))
	
		for H in ${A[@]}; do
		((M++))
		
			if [[ $H = 0 && $M -le 3 ]]; then
			eval F[-B$M]+="$E"_B_$M=\${"$E"_B_$M:-$H\ }
			elif [[ $H =~ ^[1-9] ]]; then
			eval F[-N$H]+="$E"_N_$H=\${"$E"_N_$H:-$H\ }
			else
			eval F[-L$H]+="$E"_L_$H=\${"$E"_L_$H:-$H\ }
			fi
			
		done
		
		for I in ${N[@]}; do
		((J++))
		
			if [[ -n ${F[$I]} ]]; then
			K=$I
			elif (( $J % 2 )); then
			unset && exit 1
			else
			L=$(echo ${F[$K]})
			eval export ${L/=*/=$I}
			unset F[$K]
			fi
	
		done
		
	unset M
	done
}

Decision () {

	until [[ $Say_It =~ ^(y|n) ]]; do
	read -p "$1 (y/n)?: " Say_It && Say_It=${Say_It,,}

		if [[ ! ${Say_It::1} =~ ^(y) ]] || [[ ! ${Decision_B_1:=0} = 0 ]]; then
		read -p "You selected $Say_It (y/n)?: " Say_What && Say_What=${Say_What,,}

			if [[ ! ${Say_What::1} =~ ^(y) ]] || [[ ! ${Say_It::1} =~ ^(y|n) ]]; then
			read -p "You seem unsure.."
			unset Say_It && unset Say_What
			elif [[ ${Say_It::1} =~ ^(n) && ${Say_What::1} =~ ^(y)  ]]; then
			Decision_N_1=0
			fi

		fi

	done
	
return ${Decision_N_1:=1}

}

Questionable () {

	while [[ -z "$Sound" ]]; do
	read -ep "Enter "$1"?: " Sound

		if [[ ${Questionable_B_1:=0} != 0 ]]; then
		Decision "I got: \"$Sound\" - Correct"; Sound_Check="$?"

			if [[ "$Sound_Check" != 1 ]]; then
			unset Sound
			fi

		fi

	done

	if [[ ${Questionable_B_2:=0} != 0 ]]; then
	echo "You entered: \"$Sound\""
	fi

export "$Sound"

}

Trix -B1 0 -B2 0
Questionable $1
echo $Sound

