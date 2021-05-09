FROM golang as build
ENV CGO_ENABLED 0
RUN go get -u github.com/tomnomnom/gron \
 && go build -o /gron github.com/tomnomnom/gron

FROM alpine:3.13.5 as run
RUN apk add --no-cache ca-certificates
COPY --from=build /gron /usr/local/bin/
