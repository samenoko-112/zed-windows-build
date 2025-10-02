; Zed Installer Script
!include "MUI2.nsh"

!ifndef VERSION
  !define VERSION "dev"
!endif

Name "Zed Editor ${VERSION}"
OutFile "release/ZedSetup-${VERSION}.exe"
InstallDir "$LOCALAPPDATA\Zed"
InstallDirRegKey HKCU "Software\Zed" "Install_Dir"

; アンインストーラーの出力先
UninstallExeName "uninstall.exe"

!define MUI_ABORTWARNING

; --- UI Pages ---
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; --- Languages ---
!insertmacro MUI_LANGUAGE "English"

Section "Install"
  SetOutPath "$INSTDIR"
  File "release/zed.exe"

  ; Store install dir
  WriteRegStr HKCU "Software\Zed" "Install_Dir" "$INSTDIR"

  ; "アプリと機能" 一覧に登録
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" \
    "DisplayName" "Zed Editor ${VERSION}"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" \
    "UninstallString" "$INSTDIR\uninstall.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" \
    "DisplayVersion" "${VERSION}"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" \
    "Publisher" "Zed Industries"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" \
    "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed" \
    "DisplayIcon" "$INSTDIR\zed.exe"

  ; Start Menu shortcut
  CreateDirectory "$SMPROGRAMS\Zed"
  CreateShortcut "$SMPROGRAMS\Zed\Zed.lnk" "$INSTDIR\zed.exe"

  ; Optional desktop shortcut
  MessageBox MB_YESNO "Do you want to create a desktop shortcut?" IDNO noShortcut
    CreateShortcut "$DESKTOP\Zed.lnk" "$INSTDIR\zed.exe"
  noShortcut:

  ; アンインストーラーを出力
  WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

Section "Uninstall"
  ; ファイル削除
  Delete "$INSTDIR\zed.exe"
  Delete "$INSTDIR\uninstall.exe"
  RMDir "$INSTDIR"

  ; レジストリ削除
  DeleteRegKey HKCU "Software\Zed"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Zed"

  ; ショートカット削除
  Delete "$SMPROGRAMS\Zed\Zed.lnk"
  RMDir "$SMPROGRAMS\Zed"
  Delete "$DESKTOP\Zed.lnk"
SectionEnd