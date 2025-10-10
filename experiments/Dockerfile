FROM alpine:3.10.3
RUN apk update && apk add curl
WORKDIR /app
COPY hello.sh /app
RUN chmod +x hello.sh
COPY hello.txt /app
CMD ["./hello.sh"]
