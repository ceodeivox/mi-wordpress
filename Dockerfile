FROM wordpress:php8.2-apache

# Instalar unzip y wget
RUN apt-get update && apt-get install -y unzip wget && rm -rf /var/lib/apt/lists/*

# Descargar e instalar el plugin WP Offload Media Lite
RUN wget https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.latest-stable.zip -O /tmp/plugin.zip \
    && unzip /tmp/plugin.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm /tmp/plugin.zip

# Aumentar los límites de subida de PHP a 128MB
RUN echo "file_uploads = On" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "upload_max_filesize = 128M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 128M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "max_execution_time = 300" >> /usr/local/etc/php/conf.d/uploads.ini
