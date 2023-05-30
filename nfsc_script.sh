sudo -i
yum install nfs-utils -y
systemctl enable firewalld --now
sleep 2
firewall-cmd --reload
sleep 2
echo "192.168.56.10:/srv/share/ /mnt nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab
systemctl daemon-reload 
systemctl restart remote-fs.target
sleep 2
echo "Установка завершена!!!" 
sleep 3
echo "Проверяем наличие файла test-file-check в расшаренной директории:"
ls -lh /mnt/upload/
