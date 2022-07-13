.PHONY: install

install:
	rsync -avr --update ./alacritty ~/.config/alacritty
	rsync -avr --update ./sway ~/.config/sway
	rsync -avr --update ./waybar ~/.config/waybar

collect:
	rsync -avr --update ~/.config/alacritty .
	rsync -avr --update ~/.config/sway .
	rsync -avr --update ~/.config/waybar .
