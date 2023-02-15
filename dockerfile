FROM golang:1.19.1-alpine as build
COPY . .
RUN export PATH=$PATH:/usr/local/go/bin
ENV GO111MODULE=auto
ENV GO15VENDOREXPERIMENT=1
ENV GOPATH=$home/go
ADD ./main.go /main.go

#WORKDIR /usr/src/app
RUN go env -w GO111MODULE=auto
RUN apk add git
RUN export GO111MODULE=auto
RUN GO111MODULE=auto go get database/sql
RUN GO111MODULE=auto go get fmt
RUN GO111MODULE=auto go get log
RUN GO111MODULE=auto go get net/http
RUN GO111MODULE=auto go get github.com/lib/pq
RUN mkdir -p $GOPATH
#RUN ["chmod", "777", "home/go"]
RUN GO111MODULE=auto go get github.com/caarlos0/env
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go get -u github.com/prometheus/client_golang/prometheus/promauto
RUN go get -u github.com/prometheus/client_golang/prometheus/promhttp


RUN go build -o app ./main.go 
RUN go run main.go 
#FROM golang:alpine:3.10.3 
COPY --from=build /usr/local/go/ /usr/local/go/
CMD ["./main"]

