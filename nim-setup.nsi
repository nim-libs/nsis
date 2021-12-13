; :Author: snxx
; :Copyright: GNU GPL v3.0
; :-----------------------

!addincludedir "${objdir}\Nim"
!addincludedir "${srcdir}\Nim"
!include "include\version.nsh"
!include "include\arch.nsh"

!define PRODUCT_NAME "Nim Programming Language"
!define PRODUCT_SHORT_NAME "Nim"
!define PACKAGE_NAME "${PRODUCT_NAME} ${VERSION}"
!define PACKAGE_SHORT_NAME "${PRODUCT_SHORT_NAME} ${VERSION}"

!if "${NSIS_PACKEDVERSION}" >= 0x3000000
  Unicode True
!endif

; !define MULTIUSER_EXECUTIONLEVEL Highest
; !define MULTIUSER_MUI
; !define MULTIUSER_INSTALLMODE_COMMANDLINE
; !define MULTIUSER_INSTALLMODE_INSTDIR "Nim"
; !include "Nim-MultiUser.nsh"

; !insertmacro MULTIUSER_PAGE_INSTALLMODE
; !insertmacro MULTIUSER_INSTALLMODEPAGE_INTERFACE
; :-----------------------------------------------


; The name of the installer

Name "${PACKAGE_SHORT_NAME} (${ARCH}) Setup" ; Nim 0.0.0 (64-bit) Setup
OutFile "${objdir}\nim_${VERSION}-${ARCH}.exe" ; nim_0.0.0-x64.exe or nim_0.0.0-(64-bit).exe

; Check Example: https://github.com/nim-libs/nsis/blob/master/nim-setup.nsi
; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\"
; :------------------------------

; Request application privileges for Windows Vista
RequestExecutionLevel admin
; :------------------------

; Variables
Var StartMenuFolder
Var CmdFailed
; :----------

; Interface Settings
Caption "${PACKAGE_SHORT_NAME}"
Icon "${srcdir}\nsis\assets\img\setup.ico"
UninstallIcon "${srcdir}\nsis\assets\img\uninstall.ico"
; :----------------------------------------------------

; The default installation directory
; Path: %LocalAppData%\Programs\Nim\nim_0.0.0-x64\nim.exe
InstallDir "$APPDATA\Local\Programs\Nim"
; :-------------------------------------

; Pages
!insertmacro MUI_PAGE_DIRECTORY
Page license
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles
; :-----------------

PageEx license
  LicenseBkColor color 222432 ; rgb(22, 24, 32);
  LicenseText "${PRODUCT_NAME}: License"
  LicenseData "${srcdir}\copying.txt" ; GitHub: Nim/copying.txt
  LicenseForceSelection checkbox
  LicenseForceSelection checkbox "I agree to the license agreement"
  LicenseForceSelection off
PageExEnd ; end the license PageEx
; :-------------------------------


!insertmacro MUI_LANGUAGE English

; The staff to install
Section "Nim" SecNim
  Sectionin
  SetOutPath "$APPDATA\Local\Programs\Nim\nim_${NIM_VERSION}-${ARCH}" ; Nim/nim_0.0.0-x64
  File ""
  WriteRegStr HKLM ""

  CreateShortCut ""
    
  ; WriteUninstaller "$\unins000.exe"
SectionEnd ; end the Staff section
; :-------------------------------

Section "Manual" SecManual
  SetOutPath "$INSTDIR"
  File "${srcdir}\doc\"
  CreateShortCut "${}\$StartMenuFolder\man.lnk" "$INSTDIR\nim${NIM_PACKED_VERSION}.chm"
SectionEnd ; end the Manual section
; :--------------------------------

; Uninstaller
Section "un.Uninstall"
  UninstallText
  DeleteRegKey HKLM ""

  Delete "$APPDATA\Local\Programs\Nim\nim_0.0.0-x64\nim.exe"
  Delete "$APPDATA\Local\Programs\Nim\nim_0.0.0-x64\unins000.exe"
    
  RMDir "$APPDATA\Local\Programs\Nim\nim_0.0.0-x64"
  RMDir "$APPDATA\Local\Programs\Nim"
SectionEnd ; end the Uninstall section
; :-----------------------------------

Function .onInit
  MessageBox MB_YESNO
FunctionEnd ; end the Function
; :---------------------------

Function un.onInit

FunctionEnd ; end the uninstall Function
; :-------------------------------------
