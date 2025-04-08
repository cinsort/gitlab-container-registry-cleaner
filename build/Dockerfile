FROM node:18.20.7-alpine3.21 AS node

ARG HTTP_PROXY
ARG NO_PROXY
ARG UID=3456
ARG GID=3456

ENV HTTPS_PROXY=${HTTP_PROXY}
ENV HTTP_PROXY=${HTTP_PROXY}
ENV NO_PROXY=${NO_PROXY}

WORKDIR /app

RUN if [ -n "$HTTP_PROXY" ] ; then \
        sed -ie "s/https/http/g" /etc/apk/repositories; \
        echo "proxy=${HTTP_PROXY}" >> .npmrc && \
        echo "https-proxy=${HTTP_PROXY}" >> .npmrc && \
        echo "noproxy=${NO_PROXY}" >> .npmrc && \
        echo "strict-ssl=false" >> .npmrc && \
        cat .npmrc; \
    fi;

COPY --chown=$UID:$GID ./build/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

COPY --chown=$UID:$GID ./ ./

ENTRYPOINT ["/entrypoint.sh"]
