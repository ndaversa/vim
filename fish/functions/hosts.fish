function generateHosts
  echo 127.0.0.1        localhost
  echo 255.255.255.255  broadcasthost
  echo ::1              localhost
  echo fe80::1%lo0      localhost
  echo (ip)             wattpad.dev www.wattpad.dev api.wattpad.dev
  echo (ip)             blog.wattpad.dev
  echo (ip)             embed.wattpad.dev kik.wattpad.dev
  echo (ip)             m.wattpad.dev wap.wattpad.dev get.wattpad.dev mobile.wattpad.dev touch.wattpad.dev
end;

function generateRules
  echo rdr pass on lo0 inet proto tcp from any to any port 80 -\> (ip) port 8080
  echo rdr pass on en0 inet proto tcp from any to any port 80 -\> (ip) port 8080
  echo rdr pass on lo0 inet proto tcp from any to any port 443 -\> (ip) port 8081
  echo rdr pass on en0 inet proto tcp from any to any port 443 -\> (ip) port 8081
end;

function hosts
  generateHosts > /tmp/hosts
  sudo cp /tmp/hosts /etc/hosts
  generateRules > /tmp/rules
  cp /tmp/rules ~/rules.rules
  sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
  sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
  sudo pfctl -evf ~/pf.conf
  cat /etc/hosts
  cat ~/rules.rules
end;
