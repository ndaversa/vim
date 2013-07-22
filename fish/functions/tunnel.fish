function tunnel
	ssh -N -p 22 $WORK -L 3000/localhost/3000 $argv
end;

