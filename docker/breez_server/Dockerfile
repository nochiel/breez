FROM alpine:3.12 AS builder
RUN apk update
RUN apk add git go musl-dev make
COPY ./docker/breez_server/.env .

COPY ./docker/breez_server/start.sh .
RUN chmod +x ./start.sh
RUN git clone https://github.com/breez/server
RUN cd server \
    && go build .
RUN go get github.com/joho/godotenv/cmd/godotenv
RUN git clone https://github.com/breez/lnd -b breez-node-v0.10.0-beta-htlc-interceptor-zeroconf
RUN cd lnd \
    && tage="signrpc walletrpc chainrpc invoicesrpc routerrpc backuprpc peerrpc submarineswaprpc breezbackuprpc" \
    && make install
COPY ./itest/generate_macaroon_hex.go .
RUN go build ./generate_macaroon_hex.go
RUN chmod +x ./generate_macaroon_hex
RUN go get -tags 'postgres' -u github.com/golang-migrate/migrate/cmd/migrate
ENTRYPOINT ./start.sh