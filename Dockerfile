
FROM golang:1.17 AS build


WORKDIR /app


COPY go.mod go.sum ./


RUN go mod download


COPY . .


RUN go build -o myapp .


FROM debian:buster-slim


WORKDIR /app


COPY --from=build /app/myapp .


CMD ["./myapp"]
