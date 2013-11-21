function ip
  ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 | head -n 1
end;
