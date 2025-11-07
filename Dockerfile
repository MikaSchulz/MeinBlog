FROM alpine:3.20

RUN apk add --no-cache hugo bash ca-certificates curl tar

WORKDIR /data

COPY download_repo.sh /data/download_repo.sh
RUN chmod +x /data/download_repo.sh

ENTRYPOINT ["/bin/bash", "-c", "./download_repo.sh && hugo server -s site/ --disableFastRender --bind 0.0.0.0 --port 1313 --baseURL 'https://eyetealer.me' --appendPort=false --watch=false"]
EXPOSE 1313
