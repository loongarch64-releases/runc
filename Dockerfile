FROM lcr.loongnix.cn/library/debian:unstable

RUN apt update && apt install -y git \
    golang \
    make \
    libseccomp-dev \
    build-essential

# libpathrs v0.2.5 — safe path resolution for runc
ARG LIBPATHS_VERSION=v0.2.5
RUN apt update && apt install -y \
        pkg-config \
        rustc \
        cargo \
        lld \
    && git clone --depth 1 --branch ${LIBPATHS_VERSION} \
        https://github.com/cyphar/libpathrs.git /tmp/libpathrs \
    && cd /tmp/libpathrs \
    && make release \
    && ./install.sh \
    && pkg-config --cflags --libs pathrs \
    && rm -rf /tmp/libpathrs \
    && apt remove -y rustc cargo lld \
    && apt autoremove -y

ENV RUNC_VERSION=''

CMD ["sh", "-c","/workspace/process_version.sh $RUNC_VERSION"]
