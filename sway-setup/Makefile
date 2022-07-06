.PHONY: install

install:
	work_dir = $(pwd)

	cd ./systemd && sudo make install
	systemctl --daemon-reload
	cd $(work_dir)

	cd ./configs && make install
	cd $(work_dir)

	cd ./wayland-sessions && make install
	cd $(work_dir)
