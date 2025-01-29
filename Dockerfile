FROM ubuntu AS php_base

# ---- Install PHP and all required utilities ---- #
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -qq \
    && apt-get upgrade --yes -qq \
    && apt-get install --yes -qq \
      curl \
      git \
      php \
      php-curl \
      php-mbstring \
      php-mysql \
      php-sqlite3 \
      php-xml \
      php-zip \
      unzip \
      7zip

FROM php_base AS php_with_composer
# ---- Install Composer ---- #
WORKDIR /
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --filename=/usr/local/sbin/composer
RUN php -r "unlink('composer-setup.php');"
