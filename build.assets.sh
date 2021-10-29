export GOPROXY=direct

sudo apt-get update
sudo apt-get install gcc-mingw-w64-i686 gcc-mingw-w64-x86-64 gcc-multilib
env GOOS=windows GOARCH=386 CGO_ENABLED=1 CC=i686-w64-mingw32-gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o npc_386_sdk.dll cmd/npc/sdk.go
env GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o npc_amd64_sdk.dll cmd/npc/sdk.go
env GOOS=linux GOARCH=arm GOARM=7 CGO_ENABLED=1 CC=arm-linux-gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o npc_arm_sdk.so cmd/npc/sdk.go
tar -czvf npc_sdk.tar.gz npc_386_sdk.dll npc_amd64_sdk.dll npc_arm_sdk.so npc_386_sdk.h npc_amd64_sdk.h npc_arm_sdk.h
