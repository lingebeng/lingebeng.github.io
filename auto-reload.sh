#!/bin/bash

# 自动构建并在后台启动服务器

echo "🔨 构建博客..."
uv run mkdocs build --quiet

if [ $? -eq 0 ]; then
    echo "✅ 构建成功！"

    # 检查是否已有服务器在运行
    if lsof -Pi :8000 -sTCP:LISTEN -t >/dev/null ; then
        echo "🔄 服务器已在运行，重启中..."
        pkill -f "mkdocs serve"
        sleep 1
    fi

    # 在后台启动服务器
    echo "🚀 启动服务器..."
    nohup uv run mkdocs serve > /tmp/mkdocs.log 2>&1 &

    sleep 2

    if lsof -Pi :8000 -sTCP:LISTEN -t >/dev/null ; then
        echo "✅ 服务器已启动！"
        echo "📝 访问 http://127.0.0.1:8000"
        echo "📋 日志文件: /tmp/mkdocs.log"
        echo "🛑 停止服务器: pkill -f 'mkdocs serve'"
    else
        echo "❌ 服务器启动失败，查看日志: cat /tmp/mkdocs.log"
    fi
else
    echo "❌ 构建失败"
    exit 1
fi
