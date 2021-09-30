FROM php:5.6-apache
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "php", "./script-git.php" ]