#!/bin/bash

echo "install utilities"
sudo apt-get -y update
sudo apt-get -y install curl

echo "install apache"
sudo apt-get -y install apache2
sudo service apache2 start

echo "install php"
sudo apt-get -y install php5
sudo service apache2 restart

echo "Create test file"
sudo touch /var/www/html/test.php
sudo echo "<?php
header('Content-Type: text/plain');
echo \"Server IP: \".\$_SERVER['SERVER_ADDR'];
echo \"\nClient IP: \".\$_SERVER['REMOTE_ADDR'];
echo \"\nX-Forwarded-for: \".\$_SERVER['HTTP_X_FORWARDED_FOR'];
echo \"\n\"
?>" >> /var/www/html/test.php