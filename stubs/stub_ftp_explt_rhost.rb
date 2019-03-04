set SSL false

<ruby>
framework.db.hosts.each do |host|
  host.services.each do |service|
    if service.name == "ftp"
      self.run_single("set RHOST #{host.address}")
      self.run_single("set RPORT #{service.port}")
      self.run_single("check")
    end
  end
end
</ruby>

set SSL true

<ruby>
framework.db.hosts.each do |host|
  host.services.each do |service|
    if service.name == "ftps"
      self.run_single("set RHOST #{host.address}")
      self.run_single("set RPORT #{service.port}")
      self.run_single("check")
    end
  end
end
</ruby>
