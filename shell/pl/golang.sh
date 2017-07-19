pprof go-torch
go get github.com/uber/go-torch
cd $GOPATH/src/github.com/uber/go-torch
git clone https://github.com/brendangregg/FlameGraph.git
go-torch -u http://localhost:port/
