!include "MUI2.nsh"
!include "LogicLib.nsh"

!ifndef VERSION
  !define VERSION "dev"
!endif

Name "Zed Editor ${VERSION}"
OutFile "release\ZedSetup-${VERSION}.exe"
InstallDir "$LOCALAPPDATA\Zed"
InstallDirRegKey HKCU "Software\Zed" "Install_Dir"

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

Section "Install"
  SetOutPath "$INSTDIR"
  File "release\zed.exe"

  WriteRegStr HKCU "Software\Zed" "Install_Dir" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" "DisplayName" "Zed Editor ${VERSION}"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" "UninstallString" "$INSTDIR\uninstall.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" "DisplayVersion" "${VERSION}"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" "Publisher" "Zed Industries"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" "DisplayIcon" "$INSTDIR\zed.exe"

  CreateDirectory "$SMPROGRAMS\Zed"
  CreateShortcut "$SMPROGRAMS\Zed\Zed.lnk" "$INSTDIR\zed.exe"

  WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete "$INSTDIR\zed.exe"
  Delete "$INSTDIR\uninstall.exe"
  RMDir "$INSTDIR"

  DeleteRegKey HKCU "Software\Zed"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed"

  Delete "$SMPROGRAMS\Zed\Zed.lnk"
  RMDir "$SMPROGRAMS\Zed"
SectionEnd
