# 修正后的 Makefile
BINARY_NAME = cookie.exe
BUILD_DIR = bin
SOURCE_PATH = ./cmd/main.go

# 默认目标：交叉编译Windows版本（适配Linux/macOS构建环境）
build: clean
	# 指定GOOS=windows（目标系统）、GOARCH=amd64（目标架构）
	GOOS=windows GOARCH=amd64 go build -ldflags="-H windowsgui -w -s -buildid=" -trimpath -o $(BUILD_DIR)/$(BINARY_NAME) $(SOURCE_PATH)

# 清理构建产物
clean:
	go clean
	rm -rf $(BUILD_DIR)/*  # Linux/macOS用rm，Windows用del（这里适配CI的Linux环境）

# 可选：本地Windows编译目标（若需要在Windows本地构建）
build-windows: clean
	go build -ldflags="-H windowsgui -w -s -buildid=" -trimpath -o $(BUILD_DIR)/$(BINARY_NAME) $(SOURCE_PATH)
