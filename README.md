# WallGrap

WallGrap is a specialized tool for downloading Windows Spotlight wallpapers.

**Read this in other languages: [English](README.md) | [中文](README_zh.md)**

## 📥 Download & Install

1. Visit [GitHub Releases page](https://github.com/c2hy/wall-grab)
2. Download the latest version of `WallGrap-Setup-x.x.x.exe` installer
3. Double-click to run the installer and follow the prompts to complete installation
4. After installation, find the WallGrap icon in the Start menu or desktop to launch the app

### ⚠️ Windows Security Warning Notice

Since this is an open-source project, Windows may display security warnings. This is **normal behavior** and does not indicate a security issue.

#### 🔍 Why do warnings appear?

- **Open Source Software Nature**: Open source projects typically use self-signed certificates, and Windows cannot verify the publisher identity
- **Windows Security Mechanism**: SmartScreen intercepts unsigned software to protect users
- **This is a protection mechanism**: Like a door lock, it prevents malicious software from running

#### 🛠️ How to safely continue installation?

1. When you see "Windows protected your PC"
2. Click **"More info"**
3. Click **"Run anyway"**
4. Continue with normal installation

## 🚀 User Guide

### Quick Start

1. **Launch App**: After running WallGrap, the app will automatically scan and download Windows Spotlight wallpapers
2. **Browse Images**: The app displays images in full-screen mode with mouse wheel zoom support
3. **Navigate Images**: 
   - Use left/right arrow buttons to switch images
   - Or use keyboard left/right arrow keys for navigation
4. **Save Images**: Click the save button (💾) in the top-right corner to choose save location

## 🛠️ Technical Implementation

- **Framework**: Flutter 3.9.2+
- **Language**: Dart
- **File Operations**: dart:io library
- **UI Components**: Material Design 3
- **File Selection**: file_picker plugin
- **Platform Support**: Windows 10/11

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.