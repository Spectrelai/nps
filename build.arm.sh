export GOPROXY=direct

env GOOS=linux GOARCH=arm GOARM=7 CGO_ENABLED=1 CC=gcc go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o npc_arm_sdk.so cmd/npc/sdk.go
tar -czvf npc_sdk.tar.gz npc_arm_sdk.so npc_arm_sdk.h
