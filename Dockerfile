FROM golang:1.9-alpine3.8 as build
WORKDIR /app
COPY main.go .
RUN go build -o main main.go


FROM scratch
WORKDIR /app
COPY --from=build /app/main .
CMD ["./main"]