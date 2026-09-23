FROM wordpress:php8.2-apache

# Instalar unzip y wget
RUN apt-get update && apt-get install -y unzip wget && rm -rf /var/lib/apt/lists/*

# Descargar e instalar el plugin WP Offload Media Lite
RUN wget https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.latest-stable.zip -O /tmp/plugin.zip \
    && unzip /tmp/plugin.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm /tmp/plugin.zip
