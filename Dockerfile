FROM golang:1.16.5 as build
ENV CGO_ENABLED 0
RUN go get -u github.com/tomnomnom/gron \
 && mv "$(which gron)" /gron

FROM alpine:3.13.1 as run
RUN apk add --no-cache ca-certificates
COPY --from=build /gron /usr/local/bin/
