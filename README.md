# WallGap

WallGap is a specialized tool for extracting Windows Spotlight wallpapers.

**Read this in other languages: [English](README.md) | [中文](README_zh.md)**

## 📥 Download & Install

1. Visit [GitHub Releases page](https://github.com/c2hy/wall-grab)
2. Download the latest version of `WallGap-Setup-x.x.x.exe` installer
3. Double-click to run the installer and follow the prompts to complete installation
4. After installation, find the WallGap icon in the Start menu or desktop to launch the app

### ⚠️ Windows Security Warning Notice

Since this is an open-source project, Windows may display security warnings. This is **normal behavior** and does not indicate a security issue.

#### 🔍 Why do warnings appear?

- **Open Source Software Nature**: Open source projects typically use self-signed certificates, and Windows cannot verify the publisher identity
- **Windows Security Mechanism**: SmartScreen intercepts unsigned software to protect users
- **This is a protection mechanism**: Like a door lock, it prevents malicious software from running

#### 🛠️ How to safely continue installation?

**Method 1: Through the security warning interface**
1. When you see "Windows protected your PC"
2. Click **"More info"**
3. Click **"Run anyway"**
4. Continue with normal installation

**Method 2: Through file properties**
1. Right-click the installer
2. Select **"Properties"**
3. In the "General" tab, check **"Unblock"**
4. Click **"OK"**
5. Run the installer again

**Method 3: Through Windows Security Center**
1. Open Windows Security Center
2. Go to "Virus & threat protection"
3. Click "Virus & threat protection settings"
4. Add WallGap installation directory to "Exclusions"

## 🚀 User Guide

### Quick Start

1. **Launch App**: After running WallGap, the app will automatically scan Windows Spotlight wallpapers
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