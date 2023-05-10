FROM golang:1.20.4 as build
ENV CGO_ENABLED 0
RUN go install github.com/tomnomnom/gron@latest \
 && mv "$(which gron)" /gron

FROM alpine:3.18.0 as run
RUN apk add --no-cache ca-certificates
COPY --from=build /gron /usr/local/bin/
