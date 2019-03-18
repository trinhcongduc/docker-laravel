FROM ubuntu:18.04


WORKDIR /var/www/html
ENV DEBIAN_FRONTEND=noninteractive
# Install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common && add-apt-repository -y ppa:ondrej/php \
    && apt update && apt install -y php php7.2 php7.2-fpm nginx

RUN apt install -y curl
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

EXPOSE 80
