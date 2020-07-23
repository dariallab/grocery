FROM golang:1.12.0-alpine3.9 AS builder
RUN apk add --update bash make git
RUN go get -u github.com/gobuffalo/packr/...
RUN go get -u github.com/go-swagger/go-swagger/cmd/swagger
WORKDIR /go/src/github.com/dariallab/grocery
COPY . ./
RUN make build

FROM alpine:3.9
RUN apk add --no-cache --update ca-certificates tzdata
COPY --from=builder /go/src/github.com/dariallab/grocery/build/grocery /
ENV PORT=8080
EXPOSE ${PORT}  
ENTRYPOINT ["/grocery"]