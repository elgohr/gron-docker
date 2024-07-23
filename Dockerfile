FROM golang:1.23rc2 as build
ENV CGO_ENABLED 0
RUN go install github.com/tomnomnom/gron@latest \
 && mv "$(which gron)" /gron

FROM alpine:3.20.2 as run
RUN apk add --no-cache ca-certificates
COPY --from=build /gron /usr/local/bin/
