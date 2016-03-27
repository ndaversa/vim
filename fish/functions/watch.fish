function watch --description 'watch <directory> <script>'
  fswatch -E -e '\/\.git' -i '.*(js|coffee)$' -r -L -m poll_monitor -o $argv[1] | xargs -t -n1 -P2 $argv[2]
end;
