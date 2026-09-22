FROM wordpress:php8.2-apache

RUN curl -O https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.latest-stable.zip \
    && unzip amazon-s3-and-cloudfront.latest-stable.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm amazon-s3-and-cloudfront.latest-stable.zip
