#!/bin/bash

# 启动 MkDocs 开发服务器

echo "🚀 启动博客开发服务器..."
echo ""

# 检查是否安装了 uv
if ! command -v uv &> /dev/null; then
    echo "❌ 错误: 未找到 uv 命令"
    echo "请先安装 uv: curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

# 同步依赖
echo "📦 同步依赖..."
uv sync

# 启动服务器
echo ""
echo "✅ 依赖已就绪，启动服务器..."
echo "📝 访问 http://127.0.0.1:8000 查看博客"
echo "按 Ctrl+C 停止服务器"
echo ""

# 隐藏 MkDocs 2.0 警告
export PYTHONWARNINGS="ignore"

uv run mkdocs serve
