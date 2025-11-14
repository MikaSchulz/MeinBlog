FROM alpine:3.20

RUN apk add --no-cache hugo bash ca-certificates curl tar

WORKDIR /data

COPY download_repo.sh /data/download_repo.sh
RUN chmod +x /data/download_repo.sh

ENTRYPOINT ["/bin/bash", "-c", "./download_repo.sh && hugo -s site/ --baseURL 'https://eyetealer.me' --destination /data/public && tail -f /dev/null"]
