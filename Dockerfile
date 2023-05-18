FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y mysql-server locales supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:en LC_ALL=ja_JP.UTF-8

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

RUN mkdir -p /etc/supervisor/conf.d
RUN echo "[program:mysqld]" > /etc/supervisor/conf.d/supervisord-mysqld.conf
RUN echo "command=/usr/sbin/mysqld" >> /etc/supervisor/conf.d/supervisord-mysqld.conf

RUN echo "Asia/Tokyo" > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

EXPOSE 3306

CMD ["supervisord", "-n"]
