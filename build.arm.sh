export GOPROXY=direct
export CGO_ENABLED=1

go build -ldflags "-s -w -extldflags -static -extldflags -static" -buildmode=c-shared -o build/npc_arm_sdk.so cmd/npc/sdk.go
tar -czvf npc_sdk.tar.gz build/npc_arm_sdk.so build/npc_arm_sdk.h
