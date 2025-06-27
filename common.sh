SYSTEMD(){
systemctl daemon-reload
systemctl enable ${component}
systemctl start ${component}
}

APP_PREREQ(){
useradd roboshop
cp -f ${component}.service /etc/systemd/system/${component}.service
rm -rf /app
mkdir /app 
curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip 
cd /app 
unzip /tmp/${component}.zip
cd /app 
}

NODEJS(){
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

APP_PREREQ
npm install

SYSTEMD
}

MAVEN(){
dnf install maven -y

APP_PREREQ
mvn clean package 
mv target/${component}-1.0.jar ${component}.jar  
dnf install mysql -y 
mysql -h mysql-dev.sdevops.shop -uroot -pRoboShop@1 < /app/db/schema.sql
mysql -h mysql-dev.sdevops.shop -uroot -pRoboShop@1 < /app/db/app-user.sql 
mysql -h mysql-dev.sdevops.shop -uroot -pRoboShop@1 < /app/db/master-data.sql

SYSTEMD
}


PYTHON(){
dnf install python3 gcc python3-devel -y

APP_PREREQ
pip3 install -r requirements.txt

SYSTEMD
}