# GOPATH needs to be set
# gomobile & gobind needs to be installed in $GOPATH/bin

#export GO111MODULE=off
mkdir -p build/ios
time {
    PATH=$PATH:$GOPATH/bin gomobile bind -target=ios -tags="ios experimental signrpc walletrpc chainrpc invoicesrpc routerrpc backuprpc peerrpc submarineswaprpc breezbackuprpc" -o build/ios/bindings.framework -ldflags="-s -w" github.com/breez/breez/bindings
    
    # PATH=$PATH:$GOPATH/bin gomobile bind -target=ios -tags="ios experimental signrpc walletrpc chainrpc invoicesrpc rout errpc backuprpc peerrpc submarineswaprpc breezbackuprpc" -o build/ios/bindings.xcframework -ldflags="-s -w" github.com/breez/breez/bindings
}
