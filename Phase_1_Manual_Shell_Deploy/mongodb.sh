cp -f mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-org -y 
sed -i 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf
systemctl enable mongod 
systemctl restart mongod