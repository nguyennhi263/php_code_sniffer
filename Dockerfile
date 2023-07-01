FROM php:latest

COPY docker/php.ini /usr/local/etc/php/conf.d/app.ini

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/squizlabs/PHP_CodeSniffer.git /phpcs

RUN ln -s /phpcs/bin/phpcs /usr/local/bin/phpcs
RUN ln -s /phpcs/bin/phpcbf /usr/local/bin/phpcbf

COPY ./rules/phpcs.xml /phpcs.xml

CMD [ "phpcs", "-h" ]