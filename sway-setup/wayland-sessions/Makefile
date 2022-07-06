.PHONY: install, collect

dir = $(shell pwd)
install:
	sudo rsync -avr --update $(dir)/sway-servcie /usr/local/bin/sway-servcie
	sudo chmod 755 /usr/local/bin/sway-servcie 
	
	sudo rsync -avr --update sway-service.desktop /usr/share/wayland-sessions/sway-service.desktop

collect:
	rsync -avr --update /usr/local/bin/sway-service ./sway-service
	rsync -avr --update /usr/share/wayland-sessions/sway-service.desktop ./sway-service.desktop