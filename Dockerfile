FROM ubuntu:14.04
RUN apt-get update && apt-get install -y paperkey gnupg a2ps libzbar-dev qrencode imagemagick zbar-tools
ADD gpg2qrcode.sh /usr/bin/gpg2qrcode.sh
