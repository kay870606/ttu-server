#!/bin/bash
# ====================================================================
mysql_username=pro
mysql_password=i3a3234

# ====================================================================
PATH=/bin:/usr/bin:/sbin:/usr/sbin; export PATH
export LANG=C
export DEBIAN_FRONTEND=noninteractive

sudo apt -y update
sudo apt -y upgrade

sudo apt install -y lamp-server^

sudo mysql -e "CREATE USER '$mysql_username'@'localhost' IDENTIFIED BY '$mysql_password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$mysql_username'@'localhost' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"


sudo apt install -y phpmyadmin
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin.conf
sudo systemctl reload apache2.service

