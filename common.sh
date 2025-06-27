NODEJS(){
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
useradd roboshop
cp -f ${component}.service /etc/systemd/system/${component}.service
rm -rf /app
mkdir /app 
curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip 
cd /app 
unzip /tmp/${component}.zip
cd /app 
npm install
systemctl daemon-reload
systemctl enable ${component}
systemctl start ${component}
}

MAVEN(){
dnf install maven -y
useradd roboshop
cp -f ${component}.service /etc/systemd/system/${component}.service
rm -rf /app
mkdir /app 
curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip 
cd /app 
unzip /tmp/${component}.zip
cd /app 
mvn clean package 
mv target/${component}-1.0.jar ${component}.jar  
dnf install mysql -y 
mysql -h mysql-dev.sdevops.shop -uroot -pRoboShop@1 < /app/db/schema.sql
mysql -h mysql-dev.sdevops.shop -uroot -pRoboShop@1 < /app/db/app-user.sql 
mysql -h mysql-dev.sdevops.shop -uroot -pRoboShop@1 < /app/db/master-data.sql
systemctl daemon-reload
systemctl enable ${component}
systemctl restart ${component}
}