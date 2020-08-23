FROM centos:centos7
LABEL maintainer="Sudip Kumar <sudipksaha@gmail.com>"

# Install Apache
RUN yum -y update
RUN yum -y install httpd httpd-tools
RUN yum -y install wget 

# Install EPEL Repo
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# Install PHP
RUN yum --enablerepo=remi-php73 -y install php php-bcmath php-cli php-common php-gd php-intl      php-ldap php-mbstring \
    php-mysqlnd php-pear php-soap php-xml php-xmlrpc php-zip
	
# Update Apache Configuration
RUN sed -E -i -e 's/DocumentRoot.*"/DocumentRoot "\/var\/www"/g' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e 's/<Directory "\/var\/www\/html">/<Directory "\/var\/www">/g' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php index.html.var \1/g' /etc/httpd/conf/httpd.conf

WORKDIR /opt
RUN wget https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.2.tar.gz 
RUN cd /var/www && tar -zxf /opt/mediawiki-1.34.2.tar.gz && ln -s mediawiki-1.34.2/ mediawiki 
RUN chown -R apache:apache /var/www/mediawiki

EXPOSE 80

# Start Apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]