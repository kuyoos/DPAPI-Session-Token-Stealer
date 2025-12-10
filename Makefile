# 适配 Intel 架构的 Makefile
# 64位（amd64）产物
BINARY_AMD64 = cookie-amd64.exe
# 32位（386）产物
BINARY_386 = cookie-x86.exe
BUILD_DIR = bin
SOURCE_PATH = ./cmd/main.go

# 默认目标：编译 Intel 64位（主流）
build: clean build-amd64

# 编译 Intel 64位（amd64）
build-amd64:
	@mkdir -p $(BUILD_DIR)
	GOOS=windows GOARCH=amd64 go build -ldflags="-H windowsgui -w -s -buildid=" -trimpath -o $(BUILD_DIR)/$(BINARY_AMD64) $(SOURCE_PATH)

# 编译 Intel 32位（386）
build-386:
	@mkdir -p $(BUILD_DIR)
	GOOS=windows GOARCH=386 go build -ldflags="-H windowsgui -w -s -buildid=" -trimpath -o $(BUILD_DIR)/$(BINARY_386) $(SOURCE_PATH)

# 同时编译 32+64位
build-all: clean build-amd64 build-386

# 清理产物
clean:
	go clean
	rm -rf $(BUILD_DIR)/* 2>/dev/null || true

# Windows 本地编译（Intel 64位）
build-windows-local: clean
	go build -ldflags="-H windowsgui -w -s -buildid=" -trimpath -o $(BUILD_DIR)/$(BINARY_AMD64) $(SOURCE_PATH)

# Windows 本地编译（Intel 32位）
build-windows-local-386: clean
	SET GOARCH=386 && go build -ldflags="-H windowsgui -w -s -buildid=" -trimpath -o $(BUILD_DIR)/$(BINARY_386) $(SOURCE_PATH)
