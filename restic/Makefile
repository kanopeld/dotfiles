include .env
export

DRIVE_PATH="/run/media/$(USER)/$(DRIVE_UUID)"

mount_drive:
	mkdir -p $(DRIVE_PATH)
	sudo mount UUID=$(DRIVE_UUID) $(DRIVE_PATH)

backup_home:
	restic --exclude-file=excludes.txt -r $(DRIVE_PATH)/home backup /home/johnd

backup_logs:
	restic --exclude-file=excludes.txt -r $(DRIVE_PATH)/home backup /var/log

backup_etc:
	restic --exclude-file=excludes.txt -r $(DRIVE_PATH)/home backup /etc

backup_all: backup_home backup_logs backup_etc