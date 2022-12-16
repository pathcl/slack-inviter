FROM golang:1.18-alpine as builder

WORKDIR /code/
COPY . ./

RUN apk add git build-base
RUN go build -trimpath -ldflags="-s -w" -o /slack-inviter main.go

FROM alpine:latest as alpine
RUN apk add --no-cache git ca-certificates tzdata
COPY --from=builder slack-inviter .

CMD ["/slack-inviter"]
