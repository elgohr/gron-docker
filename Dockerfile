FROM golang:1.17.7 as build
ENV CGO_ENABLED 0
RUN go get -u github.com/tomnomnom/gron \
 && mv "$(which gron)" /gron

FROM alpine:3.15.4 as run
RUN apk add --no-cache ca-certificates
COPY --from=build /gron /usr/local/bin/
