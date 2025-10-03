# zed-windows-build

<!-- EN -->

## About This Repository
This repository provides Windows binaries and installers for [Zed](https://zed.dev/).  

> [!warning]
> Zed for Windows is not officially distributed (it is currently in beta),  
> and some features may not work properly.

## Build
- Scheduled daily at 0:00 (UTC)
- Only stable versions are built
- If there is no version change from the previous build, no build is performed
- Both `zed.exe` (binary) and `ZedSetup-vx.xxx.x.exe` (installer) are released

## Notes
- As mentioned earlier, the Windows build of Zed is in beta and is not guaranteed to work perfectly.
- Since the binaries are unsigned, they may be flagged as viruses.

<!-- JA -->

## このリポジトリについて
このリポジトリは[Zed](https://zed.dev/)のWindows向けのバイナリ・インストーラーを提供します。  

> [!warning]
> Windows向けのZedは公式には配布されておらず(現在ベータ版です)、
> 一部で動作しない機能がある可能性があります。

## ビルド
- 毎日0:00(UTC)にスケジュールされています
- 安定版のみビルドを行います
- 前回からバージョンの変更がない場合はビルドを行いません
- zed.exe(バイナリ)と、ZedSetup-vx.xxx.x.exe(インストーラー)をリリースします

## 諸注意
- 先ほども申した通り、ZedのWindows向けビルドはベータ版であり、完璧に動作する保証はありません。
- 署名をしていないためウイルス判定される場合があります。
