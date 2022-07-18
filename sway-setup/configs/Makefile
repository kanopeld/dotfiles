.PHONY: install

install:
	rsync -avr --update ./alacritty ~/.config/
	rsync -avr --update ./sway ~/.config/
	rsync -avr --update ./waybar ~/.config/

collect:
	rsync -avr --update ~/.config/alacritty .
	rsync -avr --update ~/.config/sway .
	rsync -avr --update ~/.config/waybar .
