.PHONY: collect

collect:
	mkdir -p ./{sway,waybar,alacritty}
	rm -rf {sway/*,waybar/*,alacritty/*}
	rsync -r --exclude '.git' ~/.config/sway/* ./sway/.
	rsync -r ~/.config/waybar/* ./waybar/.
	rsync -r ~/.config/alacritty/* ./alacritty/.

deploy_sway:
	mkdir -p ~/.config/sway; cp -r ./sway* ~/.config/sway/.
	chmod +x ~/.config/sway/scripts/waybar.sh

install_sway_deps_arch:
	pacman -S jq