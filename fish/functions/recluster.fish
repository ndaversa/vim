function recluster
  docker exec $WWW_CONTAINER_ID bash -c "kill -s SIGUSR2 \$(pgrep -f /usr/local/bin/node\ /var/frontend/current/cluster.js)"
  cd $HOME/$DEV/$CHEF
  fig logs www
end;
