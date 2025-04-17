[Setup]
AppName=YourAppName
AppVersion=1.0
DefaultDirName={pf}\YourAppName
DefaultGroupName=YourAppName
OutputDir=installer
OutputBaseFilename=YourAppInstaller
Compression=lzma
SolidCompression=yes

[Files]
Source: "build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\YourAppName"; Filename: "{app}\your_app_name.exe"
Name: "{commondesktop}\YourAppName"; Filename: "{app}\your_app_name.exe"