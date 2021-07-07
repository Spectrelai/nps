export GOPROXY=direct

sudo apt-get update
sudo apt-get install gcc-mingw-w64-i686 gcc-mingw-w64-x86-64 gcc-multilib
env GOOS=windows GOARCH=386 CGO_ENABLED=1 CC=i686-w64-mingw32-gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o npc_386_sdk.dll cmd/npc/sdk.go
env GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o npc_amd64_sdk.dll cmd/npc/sdk.go
env GOOS=linux GOARCH=386 CGO_ENABLED=1 CC=gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o npc_386_sdk.so cmd/npc/sdk.go
env GOOS=linux GOARCH=amd64 CGO_ENABLED=1 CC=gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o npc_amd64_sdk.so cmd/npc/sdk.go
tar -czvf npc_sdk.tar.gz npc_386_sdk.dll npc_amd64_sdk.dll npc_386_sdk.so npc_amd64_sdk.so npc_sdk.h
