FROM golang:1.19-alpine as build

WORKDIR /usr/src/app

COPY main.go .

RUN go build main.go

FROM scratch

WORKDIR /home

COPY --from=build /usr/src/app .

CMD [ "./main" ]

