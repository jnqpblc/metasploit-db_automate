#!/bin/bash
if [ ! -f /usr/bin/msfconsole ]; then
	curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && sudo ./msfinstall
	sudo wget -O /opt/metasploit-framework/embedded/framework/data/wordlists/telnet_cisco_default_pass.txt http://acacha.org/~sergi/wordlists/metasploit-pro/telnet_cisco_default_pass.txt
	sudo wget -O /opt/metasploit-framework/embedded/framework/data/wordlists/telnet_cisco_default_user.txt http://acacha.org/~sergi/wordlists/metasploit-pro/telnet_cisco_default_user.txt
fi

if [ ! -d dirb ]; then
	git clone https://github.com/v0re/dirb dirb
	sudo apt-get install -y libcurl4-gnutls-dev build-essential
	cd dirb/ && ./configure && make && sudo make install && cd ..
fi

if [ ! -d nikto ]; then
	git clone https://github.com/sullo/nikto nikto
	sudo apt-get -y install libnet-ssleay-perl
	sed -i 's/^USERAGENT=.*$/USERAGENT=Mozilla\/5.0 \(compatible; Yahoo! Slurp; http:\/\/help.yahoo.com\/help\/us\/ysearch\/slurp\)/g;' nikto/program/nikto.conf
	sed -i 's/^NIKTODTD=.*$/NIKTODTD=nikto\/program\/docs\/nikto.dtd/g;' nikto/program/nikto.conf
	sed -i 's/^UPDATES=yes/UPDATES=no/g;' nikto/program/nikto.conf
	sed -i 's/^#PROMPTS=no/PROMPTS=no/g;' nikto/program/nikto.conf
fi

if [ ! -d nmap ]; then
	git clone https://github.com/nmap/nmap nmap
	sudo apt-get install -y checkinstall libpcre3-dev libssl-dev
	sed -i 's/^USER_AGENT = .*$/USER_AGENT = "Mozilla\/5.0 \(compatible; Yahoo! Slurp; http:\/\/help.yahoo.com\/help\/us\/ysearch\/slurp\)"/g;' nmap/nselib/http.lua
	cd nmap/ && ./configure && make && sudo make install && cd ..
fi

if [ ! -d skipfish ]; then
	git clone https://github.com/spinkham/skipfish skipfish
	cd skipfish/ && make && cd ..
fi

if [ ! -d sqlmap ]; then
	git clone https://github.com/sqlmapproject/sqlmap sqlmap
fi

if [ ! -d whatweb ]; then
	git clone https://github.com/urbanadventurer/WhatWeb whatweb
	sed -i 's/^\$USER_AGENT = .*$/\$USER_AGENT = "Mozilla\/5.0 \(compatible; Yahoo! Slurp; http:\/\/help.yahoo.com\/help\/us\/ysearch\/slurp\)"/g;' whatweb/whatweb
fi

if [ ! -d ikeforce ]; then
	git clone https://github.com/SpiderLabs/ikeforce ikeforce
	sudo pip install pyip pycrypto pyopenssl
fi

if [ ! -f iker.py ]; then
	wget https://raw.githubusercontent.com/isaudits/scripts/master/iker.py
fi

if [ ! -d eyewitness ]; then
	git clone https://github.com/FortyNorthSecurity/EyeWitness eyewitness
	sudo bash eyewitness/setup/setup.sh
fi

if [ ! -d jetleak ]; then
	git clone https://github.com/GDSSecurity/Jetleak-Testing-Script jetleak
fi

if [ ! -d jexboss ]; then
	git clone https://github.com/joaomatosf/jexboss jexboss
	sudo pip install -r jexboss/requires.txt 
fi

if [ ! -d struts-pwn ]; then
	git clone https://github.com/mazen160/struts-pwn struts-pwn
	sudo pip install -r struts-pwn/requirements.txt 
fi

#if [ ! -d medusa ]; then
#	git clone https://github.com/jmk-foofus/medusa medusa
#	sudo apt-get install libssl-dev -y
#	cd medusa/ && ./configure && make && sudo make install && cd ..
#fi

if [ ! -d thc-hydra ]; then
	git clone https://github.com/vanhauser-thc/thc-hydra thc-hydra
	sudo apt-get install -y libssl-dev libssh-dev libidn11-dev libpcre3-dev libgtk2.0-dev libmysqlclient-dev libpq-dev libsvn-dev firebird-dev 
	cd thc-hydra/ && ./configure && make && sudo make install && cd ..
fi

if [ ! -d wascan ]; then
	git clone https://github.com/m4ll0k/WAScan wascan
	sudo pip install BeautifulSoup
fi

if [ ! -f /usr/bin/sslscan ]; then
	if [ -d /etc/apt/ ]; then
		wget -O /tmp/sslscan_1.11.5-rbsec-1.1_amd64.deb http://http.us.debian.org/debian/pool/main/s/sslscan/sslscan_1.11.5-rbsec-1.1_amd64.deb
		wget -O /tmp/libssl1.0.2_1.0.2q-1~deb9u1_amd64.deb http://http.us.debian.org/debian/pool/main/o/openssl1.0/libssl1.0.2_1.0.2q-1~deb9u1_amd64.deb
		sudo dpkg -i /tmp/libssl1.0.2_1.0.2q-1~deb9u1_amd64.deb 
		sudo dpkg -i /tmp/sslscan_1.11.5-rbsec-1.1_amd64.deb
	fi
fi
