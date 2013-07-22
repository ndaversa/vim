function pushsdk
	rsync -zvrci --delete $HOME/$DEV/$SDK/ $WORK:$HOME/$DEV/$SDK/
end;
