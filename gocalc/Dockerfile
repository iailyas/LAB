FROM golang:1.19.1-alpine AS build

WORKDIR /go/src/myapp/

COPY main.go .

RUN go mod init main.go
RUN go get database/sql
RUN go get fmt
RUN go get github.com/lib/pq
RUN go get log
RUN go get net/http
RUN go get github.com/caarlos0/env
RUN go get github.com/prometheus/client_golang/prometheus
RUN go get github.com/prometheus/client_golang/prometheus/promhttp

#RUN go build -o /bin/app main.go

RUN CGO_ENABLED=0 GOOS=linux  go build -a -installsuffix cgo -o app .

FROM alpine:3.10.3

WORKDIR /root/
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*
COPY --from=build /go/src/myapp/app .

#CMD ["./app"]
