FROM python:3.9-slim AS builder

WORKDIR /app

COPY . .

RUN python make-data.py

FROM alpine:3.21

RUN apk add --no-cache \
    apache2-utils

COPY --from=builder /app/posta /posta

COPY --from=builder /app/postb /postb

COPY generate-votes.sh /generate-votes.sh

ENTRYPOINT ["sh", "generate-votes.sh"]