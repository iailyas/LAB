FROM alpine:3.10

RUN apk update && \
	apk upgrade && \
	apk add curl

#ENTRYPOINT curl 
