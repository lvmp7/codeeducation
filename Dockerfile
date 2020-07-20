FROM golang:1.14.6-alpine3.12 as builder
RUN mkdir /build 
ADD main.go /build/
WORKDIR /build 
RUN go build -o main .

FROM scratch
COPY --from=builder /build/main /app/
WORKDIR /app
CMD ["./main"]