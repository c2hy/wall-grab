; installer.iss — WallGap Windows 安装包脚本
#define MyAppName "WallGap"
#define MyAppExeName "WallGap.exe"
#define MyAppVersion GetEnv("APP_VERSION")

[Setup]
AppName={#MyAppName}
AppVersion={#MyAppVersion}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=installer_output
OutputBaseFilename=WallGap-Setup-{#MyAppVersion}
SetupIconFile=assets\app_icon.ico  ; 可选：替换为你的图标路径
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=lowest

[Files]
Source: "build\windows\runner\Release\*"; DestDir: "{app}"; Flags: recursesubdirs

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Tasks]
Name: desktopicon; Description: "创建桌面快捷方式"; GroupDescription: "附加任务:"; Flags: unchecked

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "立即运行 WallGap"; Flags: postinstall nowait skipifsilent