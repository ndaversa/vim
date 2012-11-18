function pullsdk
	rsync -zvrci --delete $WORK:$HOME/$DEV/$SDK/ $HOME/$DEV/$SDK/
end;
