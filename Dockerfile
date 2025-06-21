FROM golang:1.23-bookworm AS base

WORKDIR /app
COPY . .
RUN go build -o main .

FROM gcr.io/distroless/base
COPY --from=base /app/main .
COPY --from=base /app/static ./static
EXPOSE 8080
CMD ["./main"]