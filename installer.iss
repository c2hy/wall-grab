; installer.iss — WallGrap Windows installer script
#define MyAppName "WallGrap"
#define MyAppExeName "wall_grap.exe"
#define MyAppVersion GetEnv("APP_VERSION")
#if MyAppVersion == ""
  #define MyAppVersion "1.0.0"
#endif

[Setup]
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher=WallGrap
AppPublisherURL=https://github.com/c2hy/wall-grab
DefaultDirName={userappdata}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=installer_output
OutputBaseFilename=WallGrap-Setup-{#MyAppVersion}
SetupIconFile=assets\app_icon.ico
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=lowest
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; 包含所有构建文件
Source: "build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
// 检查 Visual C++ 运行时
function InitializeSetup(): Boolean;
var
  ResultCode: Integer;
begin
  Result := True;
  
  // 检查是否安装了 Visual C++ Redistributable
  if not RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64') then
  begin
    if MsgBox('WallGrap requires Microsoft Visual C++ Redistributable to run.' + #13#10 + #13#10 +
              'Would you like to download and install it now?' + #13#10 +
              '(If already installed, please ignore this prompt)', 
              mbConfirmation, MB_YESNO) = IDYES then
    begin
      ShellExec('open', 
                'https://aka.ms/vs/17/release/vc_redist.x64.exe', 
                '', '', SW_SHOWNORMAL, ewNoWait, ResultCode);
    end;
  end;
end;