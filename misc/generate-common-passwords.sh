#!/bin/bash
if [ -z $8 ];then printf "\nSyntax: $0 <YY|18|19|17> <Word1|October> <Word2|November> <Word3|December> <Word4|Autumn> <Word5|Winter> <Word6|Welcome> <Word7|Password>\n\n"
	printf "Example words: January February March April May June July August September October November December Spring Summer Fall Autumn Winter Welcome Password P@ssword\n\n"
else
YY=$1
LIST0="$2 $3 $4 $5 $6 $7 $8"
LIST1="$2 $3 $4 $5 $6 $7 $8"
for x in `echo $LIST1|tr ' ' '\n'`; do for y in `echo $YY $YY\! 20$YY 20$YY\!|tr ' ' '\n'`; do echo $x$y;done;done > ~/common-passwords.txt
for x in `echo $LIST0|tr ' ' '\n'`; do for y in `echo 1 2 3 123 1234 1\! 2\! 3\! 123\! 1234\!|tr ' ' '\n'`; do echo $x$y;done;done >> ~/common-passwords.txt
fi
