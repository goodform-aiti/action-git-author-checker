FROM alpine:3.10.3


LABEL version="1.0"
LABEL maintainer="Amir Alian <amir@ateli.cz>"

COPY "entrypoint.sh" "/entrypoint.sh"

RUN apk add --no-cache bash curl jq

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
