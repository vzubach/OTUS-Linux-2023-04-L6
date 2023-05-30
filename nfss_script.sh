sudo -i
yum install nfs-utils -y
systemctl enable firewalld --now
firewall-cmd --add-service="nfs3" --permanent
firewall-cmd --add-service="rpc-bind" --permanent
firewall-cmd --add-service="mountd" --permanent
firewall-cmd --reload
sleep 2
systemctl enable nfs --now	
mkdir -p /srv/share/upload
chown -R nfsnobody:nfsnobody /srv/share 
chmod 0777 /srv/share/upload
echo "/srv/share 192.168.56.11/32(rw,sync,root_squash)" >> /etc/exports
systemctl restart nfs.service
sleep 2
touch /srv/share/upload/test-file-check

