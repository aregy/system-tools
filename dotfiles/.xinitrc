gsettings set org.gnome.desktop.input-sources xkb-options '["caps:ctrl_modifier"]'
sudo systemd-hwdb update
sudo udevadm trigger
