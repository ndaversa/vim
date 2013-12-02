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

function hosts
  generateHosts > /tmp/hosts
  sudo cp /tmp/hosts /etc/hosts
  sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
  sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
  sudo pfctl -evf ~/pf.conf
  cat /etc/hosts
end;
