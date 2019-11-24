#!/bin/bash

# Install
sudo pip install django-autofixture pytz
sudo apt-get install -y w3m

# Nginx
if [ -f /etc/nginx/sites-enabled/default ]; then
  sudo rm /etc/nginx/sites-enabled/default
fi
touch /home/box/nginx.log
sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/ask.conf
sudo /etc/init.d/nginx restart

# Gunicorn (ver. 17.5)
touch /home/box/gunicorn.log
#sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test
#sudo ln -sf /home/box/web/etc/gunicorn_ask.conf /etc/gunicorn.d/ask
sudo gunicorn -c /home/box/web/etc/gunicorn.conf hello:wsgi_application
sudo gunicorn -c /home/box/web/etc/gunicorn_ask.conf ask.wsgi:application
sudo /etc/init.d/gunicorn restart


# MySQL
sudo /etc/init.d/mysql start
sudo mysql -uroot -e "create database stepic_web;"
sudo mysql -uroot -e "grant all privileges on stepic_web.* to 'box'@'localhost' with grant option;"