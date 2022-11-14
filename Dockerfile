FROM golang:1.19.3 as build
ENV CGO_ENABLED 0
RUN go install github.com/tomnomnom/gron@latest \
 && mv "$(which gron)" /gron

FROM alpine:3.16.3 as run
RUN apk add --no-cache ca-certificates
COPY --from=build /gron /usr/local/bin/
