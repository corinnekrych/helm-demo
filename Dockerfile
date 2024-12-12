FROM golang:1.23.3 as builder

WORKDIR /app

COPY . ./
RUN go build -o main -buildvcs=false 

FROM golang:1.23.3

COPY --from=builder /app/main /app/main

CMD ["/app/main"]