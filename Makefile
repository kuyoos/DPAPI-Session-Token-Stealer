# 仅编译 Intel 64位的 Makefile
BINARY_AMD64 = cookie-amd64.exe
BUILD_DIR = bin
SOURCE_PATH = ./cmd/main.go

# 默认目标：Intel 64位
build: clean build-amd64

# 编译 Intel 64位（amd64）
build-amd64:
	@mkdir -p $(BUILD_DIR)
	GOOS=windows GOARCH=amd64 go build -ldflags="-H windowsgui -w -s -buildid=" -trimpath -o $(BUILD_DIR)/$(BINARY_AMD64) $(SOURCE_PATH)

# 清理产物
clean:
	go clean
	rm -rf $(BUILD_DIR)/* 2>/dev/null || true

# Windows 本地编译（Intel 64位）
build-windows-local: clean
	go build -ldflags="-H windowsgui -w -s -buildid=" -trimpath -o $(BUILD_DIR)/$(BINARY_AMD64) $(SOURCE_PATH)
