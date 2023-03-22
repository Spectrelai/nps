export GOPROXY=direct

sudo apt-get update
sudo apt-get install gcc-multilib gcc-mingw-w64-i686 gcc-mingw-w64-x86-64 
sudo apt-get install gcc-arm-linux-gnueabihf

env GOOS=windows GOARCH=386 CGO_ENABLED=1 CC=i686-w64-mingw32-gcc go build -buildmode=c-archive -o libnpc_386_sdk.lib cmd/npc/sdk.go
env GOOS=windows GOARCH=386 CGO_ENABLED=1 CC=i686-w64-mingw32-gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o libnpc_386_sdk.dll cmd/npc/sdk.go
env GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -buildmode=c-archive -o libnpc_amd64_sdk.lib cmd/npc/sdk.go
env GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o libnpc_amd64_sdk.dll cmd/npc/sdk.go
tar -czvf npc_windows_sdk.tar.gz libnpc_386_sdk.dll libnpc_386_sdk.lib libnpc_386_sdk.h libnpc_amd64_sdk.dll libnpc_amd64_sdk.lib libnpc_amd64_sdk.h 

env GOOS=linux GOARCH=arm GOARM=7 CGO_ENABLED=1 CC=arm-linux-gnueabihf-gcc go build -buildmode=c-archive -o libnpc_arm_sdk.a cmd/npc/sdk.go
env GOOS=linux GOARCH=arm GOARM=7 CGO_ENABLED=1 CC=arm-linux-gnueabihf-gcc go build -buildmode=c-shared -o libnpc_arm_sdk.so cmd/npc/sdk.go
env GOOS=linux GOARCH=amd64 CGO_ENABLED=1 CC=gcc go build -buildmode=c-archive -o libnpc_amd64_sdk.a cmd/npc/sdk.go
env GOOS=linux GOARCH=amd64 CGO_ENABLED=1 CC=gcc go build -buildmode=c-shared -o libnpc_amd64_sdk.so cmd/npc/sdk.go
tar -czvf npc_linux_sdk.tar.gz libnpc_arm_sdk.a libnpc_arm_sdk.so libnpc_arm_sdk.h libnpc_amd64_sdk.a libnpc_amd64_sdk.so libnpc_amd64_sdk.h
