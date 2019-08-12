# db_automate
A pentest scanning task automation project using custom resource files and Metasploit's internal services database.

This project is a beta attempt to automate scanning tasks using the Metasploit database.

db_\* files like db_nikto will run the associated external command only against the specific services that match the tool

The \*.rc files are the shell resource files for each MetaSploit module. To include a new module, simply create a new *.rc file and link it to the appropreiate stub ruby file (\*.rb). 

The \*.rb files are the brains of each resource (\*.rc and \*.db) file. These files are shared resources for each akin resource (\*.rc) file.

Below is a example:

```
$ python setup.py clone // will download all needed repos
$ python setup.py build // will install all needed packages and build specific repos
$ python setup.py pull // will to update all git repos
```

```
$ cat ftp_anonymous.rc
use auxiliary/scanner/ftp/anonymous
resource stub_ftp_rhosts.rb
```

```
$ cat stub_ftp_rhosts.rb 
<ruby>
framework.db.hosts.each do |host|
  host.services.each do |service|
    if service.name == "ftp"
      self.run_single("set RHOSTS #{host.address}")
      self.run_single("set RPORT #{service.port}")
      self.run_single("run")
    end
  end
end
</ruby>
```

My example methodology is as follows:

1> Begin with a masscan scan and then db_import masscan-output.xml or "msf> resource db_portscan", which pulls its targets from ~/targets file.

2> "msf> resource db_verscan" <~ loops over all services in the msf database and uses nmap to preform a version scan.

3> "msf> resource db_whatweb" <~ loops over all web services in the msf database and runs whatweb against them.

4> "msf> resource db_nikto" <~ loops over all web services in the msf database and runs nikto against them. 

5> "msf> resource db_dirb" <~ loops over all web services in the msf database and runs dirb against them.

6> "msf> resource db_sqlmap" <~ loops over all web services in the msf database and runs sqlmap against them.

7> "msf> resource db_w3af" <~ loops over all web services in the msf database and runs w3af against them.

8> "msf> resource db_auxiliary_scanners" <~ loops over all services in the msf database and runs ALL auxiliary scripts against them.

9> "msf> resource db_exploit_scanners" <~ loops over all services in the msf database and runs only the exploit scripts with a check function against them.
