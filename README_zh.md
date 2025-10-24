# WallGrap

WallGrap 是一款专门用于下载 Windows Spotlight 壁纸的工具。

**Read this in other languages: [English](README.md) | [中文](README_zh.md)**

## 📥 下载安装

1. 访问 [GitHub Releases 页面](https://github.com/c2hy/wall-grab/releases)
2. 下载最新版本的 `WallGrap-Setup-x.x.x.exe` 安装包
3. 双击运行安装程序，按照提示完成安装
4. 安装完成后，在开始菜单或桌面找到 WallGrap 图标启动应用

### ⚠️ Windows 安全警告说明

由于这是开源项目，Windows 可能会显示安全警告。这是**正常现象**，不代表软件有安全问题。

#### 🔍 为什么会出现警告？

- **开源软件特性**: 开源项目通常使用自签名证书，Windows 无法验证发布者身份
- **Windows 安全机制**: SmartScreen 会拦截未签名的软件以保护用户安全
- **这是保护机制**: 就像门锁一样，防止恶意软件运行

#### 🛠️ 如何安全地继续安装？

1. 当看到 "Windows 已保护你的电脑" 时
2. 点击 **"更多信息"**
3. 点击 **"仍要运行"**
4. 继续正常安装

## 🚀 使用指南

### 快速开始

1. **启动应用**: 运行 WallGrap 后，应用会自动扫描并下载 Windows Spotlight 壁纸
2. **浏览图片**: 应用以全屏模式显示图片，支持鼠标滚轮缩放
3. **导航图片**: 
   - 使用左右箭头按钮切换图片
   - 或使用键盘左右方向键导航
4. **保存图片**: 点击右上角的保存按钮（💾），选择保存位置

## 🛠️ 技术实现

- **框架**: Flutter 3.9.2+
- **语言**: Dart
- **文件操作**: dart:io 库
- **UI组件**: Material Design 3
- **文件选择**: file_picker 插件
- **平台支持**: Windows 10/11

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。
