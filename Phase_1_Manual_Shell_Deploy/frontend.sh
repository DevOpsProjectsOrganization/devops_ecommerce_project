dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y
cp -f frontend.service /etc/nginx/nginx.conf
rm -rf /usr/share/nginx/html/* 
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip
systemctl enable nginx 
systemctl restart nginx 