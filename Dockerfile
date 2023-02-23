FROM golang:1.19.1-alpine AS build
WORKDIR /app
COPY ./main.go /app/main.go
RUN go mod init app
RUN GO111MODULE=auto go get .
RUN go build -o app
FROM alpine:3.10.3
WORKDIR /app
COPY --from=build /app/app /app/app
CMD ["/app/app"]
