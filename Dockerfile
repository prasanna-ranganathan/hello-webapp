FROM golang:1.17.8-alpine3.15 as hello-app

WORKDIR /build
ADD go.mod go.sum hello.go /build
RUN go build

FROM alpine
WORKDIR /app
RUN adduser -S -D -H -h /app appuser
USER appuser
COPY --from=hello-app /build/helloworld /app
EXPOSE 3000
CMD [ "./helloworld"]
