.PHONY: collect
collect:
	mkdir -p ./{sway,waybar,alacritty,zsh,vim}
	rm -rf {sway/*,waybar/*,alacritty/*}
	rsync -r --exclude '.git' ~/.config/sway/* ./sway/.
	rsync -r ~/.config/waybar/* ./waybar/.
	rsync -r ~/.config/alacritty/* ./alacritty/.
	rsync -r ~/.zshrc ./zsh
	rsync -r ~/.vimrc ./vim

deploy_sway:
	mkdir -p ~/.config/sway
	rsync -r ./sway/* ~/.config/sway/
	chmod +x ~/.config/sway/scripts/waybar.sh

	# set dotfiles env
	echo 'set $$dotfiles_path $(shell pwd)' >> ~/.config/sway/config.d/00-base.conf
