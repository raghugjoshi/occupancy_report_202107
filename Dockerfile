ARG RUBY_VERSION=2.7.1

FROM ruby:$RUBY_VERSION-slim-buster as builder

RUN apt-get update && apt-get install -y --no-install-recommends build-essential curl gcc g++ python lsb-release wget gnupg \
  && curl -sL https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb > /tmp/mysql-apt-config_0.8.15-1_all.deb \
  && DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/mysql-apt-config_0.8.15-1_all.deb \
  && apt-get update \
  && apt-get install -y mysql-client libmysqlclient-dev

COPY Gemfile* /tmp/
RUN cd /tmp && bundle install --jobs="$(grep -c processor /proc/cpuinfo)" \
  && rm -rf /usr/local/bundle/cache

FROM ruby:$RUBY_VERSION-slim-buster

ENV TZ=Asia/Tokyo \
  LC_ALL=C.UTF-8 \
  LANG=C.UTF-8 \
  MALLOC_ARENA_MAX=2 \
  RAILS_ROOT=/app

RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  dnsutils \
  file \
  git \
  jq \
  less \
  tzdata \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  \
  # Debian busterのopenssl設定で、MinProtocolをv1.1に下げる
  # (Dockerのmysql:5.7でtls_option v1.2を指定できないため)
  # @see https://github.com/docker-library/mysql/issues/567
  && sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1.1/' /etc/ssl/openssl.cnf \
  \
  # timezone
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
  \
  # Railsルートディレクトリ作成
  && mkdir $RAILS_ROOT

WORKDIR $RAILS_ROOT
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

COPY --from=builder /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
COPY --from=builder /usr/bin/mysql* /usr/bin/
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . $RAILS_ROOT
