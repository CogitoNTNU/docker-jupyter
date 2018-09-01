if [ "$1" = "" ]; then
	sudo python3 etc/launch.py 1
else
	sudo python3 etc/launch.py "$1"
fi
