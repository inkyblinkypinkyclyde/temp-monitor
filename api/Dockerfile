# syntax=docker/dockerfile:1

FROM golang:1.22 AS build-stage

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /temp-monitor-api

FROM build-stage AS run-test-stage

FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /

COPY --from=build-stage /temp-monitor-api /temp-monitor-api

EXPOSE 8081
EXPOSE 5435

USER nonroot:nonroot

ENTRYPOINT ["/temp-monitor-api"]