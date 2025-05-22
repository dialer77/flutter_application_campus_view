#define MyAppName "YourAppName"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Your Company"
#define MyAppURL "https://yourwebsite.com"
#define MyAppExeName "your_app.exe"

[Setup]
AppId={{GUID}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename={#MyAppName}_Installer
Compression=lzma
SolidCompression=yes
PrivilegesRequired=lowest
CloseApplications=yes

; Visual C++ 재배포 가능 패키지 포함 설정
[Files]
Source: "path\to\build\windows\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
Source: "path\to\vc_redist.x64.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Run]
; Visual C++ 재배포 가능 패키지 설치
Filename: "{tmp}\vc_redist.x64.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing Visual C++ redistributable..."; Check: ShouldInstallVCRedist
; 설치 후 프로그램 실행
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
function ShouldInstallVCRedist(): Boolean;
var
  Version: string;
begin
  // VC++ 2015-2022 재배포 가능 패키지가 이미 설치되어 있는지 확인
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64', 'Version', Version) then
  begin
    // 버전 체크 로직
    Result := CompareStr(Version, '14.29.30037.0') < 0;
  end
  else
  begin
    Result := True;
  end;
end;