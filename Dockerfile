FROM alpine:latest

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add php8 php8-xml php8-xmlwriter php8-xmlreader php8-exif php8-fpm php8-session php8-soap php8-openssl php8-gmp$COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
LABEL org.opencontainers.image.source="https://github.com/Dragon-Node/nextcloud-image"
