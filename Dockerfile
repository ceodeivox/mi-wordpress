FROM wordpress:php8.2-apache

# Instalar la herramienta unzip
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Descargar e instalar el plugin
RUN curl -O https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.latest-stable.zip \
    && unzip amazon-s3-and-cloudfront.latest-stable.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm amazon-s3-and-cloudfront.latest-stable.zip
