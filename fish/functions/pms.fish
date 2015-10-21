killall "Plex Media Server"
killall "Plex Media Player"
sleep 5
rm -rfv /Library/Application\ Support/Plex\ Media\ Server/Plug-ins/Framework.bundle
rm -rfv /Library/Application\ Support/Plex\ Media\ Server/Plug-ins/System.bundle
sleep 5
open -a "Plex Media Server"
open -a "Plex Media Player"
