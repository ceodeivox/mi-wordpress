FROM wordpress:php8.3-apache

# Instalar unzip y wget
RUN apt-get update && apt-get install -y unzip wget && rm -rf /var/lib/apt/lists/*

# Copiar la configuración personalizada de PHP
COPY uploads.ini $PHP_INI_DIR/conf.d/uploads.ini

# Copiar y descomprimir los zips con sus nombres exactos
COPY elementor-pro.zip /tmp/elementor-pro.zip
COPY hello-elementor.3.5.1.zip /tmp/hello-elementor.zip
RUN unzip /tmp/elementor-pro.zip -d /usr/src/wordpress/wp-content/plugins/ && rm /tmp/elementor-pro.zip
RUN unzip /tmp/hello-elementor.zip -d /usr/src/wordpress/wp-content/themes/ && rm /tmp/hello-elementor.zip

# Descargar e instalar los plugins gratuitos automáticamente
WORKDIR /usr/src/wordpress/wp-content/plugins/
RUN wget https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.latest-stable.zip -O s3.zip && unzip s3.zip && rm s3.zip \
    && wget https://downloads.wordpress.org/plugin/elementor.latest-stable.zip -O elementor.zip && unzip elementor.zip && rm elementor.zip \
    && wget https://downloads.wordpress.org/plugin/bdthemes-element-pack-lite.latest-stable.zip -O element-pack.zip && unzip element-pack.zip && rm element-pack.zip \
    && wget https://downloads.wordpress.org/plugin/bdthemes-prime-slider-lite.latest-stable.zip -O prime-slider.zip && unzip prime-slider.zip && rm prime-slider.zip \
    && wget https://downloads.wordpress.org/plugin/creame-whatsapp-me.latest-stable.zip -O joinchat.zip && unzip joinchat.zip && rm joinchat.zip \
    && wget https://downloads.wordpress.org/plugin/elementskit-lite.latest-stable.zip -O elementskit.zip && unzip elementskit.zip && rm elementskit.zip \
    && wget https://downloads.wordpress.org/plugin/essential-addons-for-elementor-lite.latest-stable.zip -O essential.zip && unzip essential.zip && rm essential.zip \
    && wget https://downloads.wordpress.org/plugin/premium-addons-for-elementor.latest-stable.zip -O premium.zip && unzip premium.zip && rm premium.zip

# Restaurar directorio de trabajo por defecto
WORKDIR /var/www/html
