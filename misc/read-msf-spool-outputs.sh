#!/bin/bash
if [ -z $2 ]; then printf "\nSytnax: $0 <dir|~/msf_CLIENT_output> <type|aux|exp>\n\n"
	else
   CLIENT=$1; TYPE=$2;
   if [ "$TYPE" == "aux" ]; then
      egrep '\+|Using' $CLIENT/msf-auxiliary-console-output.log|grep -B1 '+'
   elif [ "$TYPE" == "exp" ]; then
      egrep '\+|Using' $CLIENT/msf-exploits-console-output.log|grep -B1 '+'
   else
      echo "Dammit Bobby."
  fi
fi
