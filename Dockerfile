FROM php:5.6-cli

MAINTAINER Herman J. Radtke III <herman@hermanradtke.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates curl git libssl-dev
RUN curl -sL https://static.rust-lang.org/dist/rust-nightly-x86_64-unknown-linux-gnu.tar.gz | tar xvz -C /tmp && /tmp/rust-nightly-x86_64-unknown-linux-gnu/install.sh

RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ONBUILD COPY . /source
ONBUILD RUN cd rust && cargo build
ONBUILD RUN cd php-ext && phpize && ./configure --with-score=../rust/target/debug && make

VOLUME ["/source"]
WORKDIR /source
