# Haifeng's AI Lab 🔬

个人技术博客，专注于 AI 基础设施相关的技术分享。

## 🌐 在线访问

[https://lingebeng.github.io](https://lingebeng.github.io)

## 📚 内容分类

### 📝 Blogs
- **Scaling-Book** - 大规模模型训练与扩展
- **Pallas-Kernel** - Pallas 内核编程与优化
- **SGLang-Jax** - 用 JAX 实现的 SGLang 框架

### 📚 Notes
- **Algorithm** - 算法与数据结构
- **Python** - Python 编程技巧
- **CS336** - Stanford CS336 课程笔记

### 📖 Paper Reading
- 学术论文阅读笔记

### 👤 About
- **Running** - 跑步记录与感悟
- **Scenery** - 风景与摄影
- **Thinking** - 随想与思考

## 🛠️ 技术栈

- **框架**: [MkDocs](https://www.mkdocs.org/)
- **主题**: [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- **部署**: GitHub Pages
- **包管理**: [uv](https://github.com/astral-sh/uv)

## 🚀 本地开发

### 安装依赖

```bash
# 安装 uv（如果还没安装）
curl -LsSf https://astral.sh/uv/install.sh | sh

# 同步依赖
uv sync
```

### 启动开发服务器

```bash
# 方式 1: 使用启动脚本
./start.sh

# 方式 2: 使用自动重载脚本（后台运行）
./auto-reload.sh

# 方式 3: 直接使用 mkdocs
uv run mkdocs serve
```

访问 http://127.0.0.1:8000 查看博客。

### 构建静态文件

```bash
uv run mkdocs build
```

生成的静态文件在 `site/` 目录。

## 📝 写作指南

### 添加博客文章

1. 在对应专题目录下创建 `.md` 文件（如 `docs/blogs/scaling-book/`）
2. 在 `mkdocs.yml` 的 `nav` 中添加条目
3. 使用 `./auto-reload.sh` 自动构建和预览

### 添加学习笔记

1. 在 `docs/notes/` 对应分类下创建 `.md` 文件
2. 在 `mkdocs.yml` 的 `nav` 中添加条目

### 添加论文笔记

1. 在 `docs/paperreading/` 目录下创建 `.md` 文件
2. 在 `mkdocs.yml` 的 `nav` 中添加条目

### 添加生活记录

1. 在 `docs/about/` 对应分类下创建 `.md` 文件（running/scenery/thinking）
2. 在 `mkdocs.yml` 的 `nav` 中添加条目

## 🎨 主题特色

- 🌈 二次元风格的渐变导航栏
- 💫 动画效果和悬停交互
- 🎴 Emoji 保持原色
- 🔄 自动年份更新
- 🌓 深色/浅色模式切换
- 📱 响应式设计

## 🚀 部署

推送到 `main` 分支后，GitHub Actions 会自动构建并部署到 GitHub Pages。

### 工作流程

1. 本地编辑 `docs/` 下的 Markdown 文件
2. `git push` 推送到 GitHub
3. GitHub Actions 自动运行 `mkdocs build`
4. 自动部署到 https://lingebeng.github.io

注意：`site/` 目录被 `.gitignore` 忽略，不需要提交。

## 👤 作者

**Haifeng Lin**

- GitHub: [@lingebeng](https://github.com/lingebeng)
- Blog: [https://lingebeng.github.io](https://lingebeng.github.io)

---

**Where Ideas Meet Infrastructure** 🔬
