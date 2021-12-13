.PHONY: collect
collect:
	mkdir -p ./{sway,waybar,alacritty,zsh,vim}
	rm -rf {sway/*,waybar/*,alacritty/*}
	rsync -r --exclude '.git' ~/.config/sway/* ./sway/.
	rsync -r ~/.config/waybar/* ./waybar/.
	rsync -r ~/.config/alacritty/* ./alacritty/.
	rsync -r ~/.zshrc ./zsh
	rsync -r ~/.vimrc ./vim

.PHONY: prepare_dirs
prepare_dirs:
	sudo mkdir -p /var/log/usr
	sudo chown -R $(USER):$(USER) /var/log/usr

deploy_sway:
	mkdir -p ~/.config/sway; cp -r ./sway* ~/.config/sway/.
	chmod +x ~/.config/sway/scripts/waybar.sh
