; # [ zrfisaac ]

; # [ sobre ]
; # - autor : Isaac Santana
; # . - email : zrfisaac@gmail.com
; # . - site : zrfisaac.github.io

; # [ nsis ]

; # - Biblioteca
!include "MUI2.nsh"
!include "x64.nsh"

; # - Geral
Name "Guará 1.0.0"
OutFile "Saida\Guara_1.0.0.exe"
Unicode True
InstallDir "$LOCALAPPDATA\zrfisaac\Guara"
InstallDirRegKey HKCU "SOFTWARE\zrfisaac\Guara" ""
RequestExecutionLevel User

; # - Imagens
!define MUI_ICON "Recursos\Instalador.ico" 
!define MUI_UNICON "Recursos\Desinstalador.ico" 
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "Recursos\InstaladorCabecalho.bmp"
!define MUI_HEADERIMAGE_UNBITMAP  "Recursos\DesinstaladorCabecalho.bmp"
!define MUI_HEADERIMAGE_RIGHT
!define MUI_BGCOLOR FFFFFF
!define MUI_HEADER_TRANSPARENT_TEXT
!define MUI_TEXTCOLOR 000000
!define MUI_WELCOMEFINISHPAGE_BITMAP "Recursos\InstaladorLateral.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "Recursos\DesinstaladorLateral.bmp"

; # - Atalhos
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "$(MUI_Shortcut)"
!define MUI_FINISHPAGE_RUN_FUNCTION "fnShortcut"
Function "fnShortcut"
	CreateShortCut "$DESKTOP\Guará.lnk" "$INSTDIR\Guara.exe"
FunctionEnd

; # - Interface
!define MUI_ABORTWARNING

; # - Pagina - Instalador
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; # - Pagina - Desinstalador
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; # - Idioma
!insertmacro MUI_LANGUAGE "PortugueseBR"
Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

; # - Versao
VIProductVersion "1.0.0.0"
VIAddVersionKey "ProductName" "Guará"
VIAddVersionKey "Comments" ""
VIAddVersionKey "CompanyName" "Isaac Santana / zrfisaac.github.io"
VIAddVersionKey "LegalTrademarks" "Isaac Santana / zrfisaac.github.io"
VIAddVersionKey "LegalCopyright" "Isaac Santana / zrfisaac.github.io"
VIAddVersionKey "FileDescription" "Guará"
VIAddVersionKey "FileVersion" "1.0.0.0"
VIAddVersionKey "ProductVersion" "1.0.0.0"

; # - Traducao
LangString MUI_Shortcut ${LANG_PORTUGUESEBR} "Criar atalho na área de trabalho"

; # - Instalador
Section Base
	; # : - Obrigatorio
	SectionIn RO

	; # : - Arquivos
	SetOutPath "$INSTDIR"
	File "Saida\Guara.exe"
	File "Guara.ico"

	; # : - Desinstalador
	WriteUninstaller "$INSTDIR\Uninstall.exe"

	; # : - Atalhos
	CreateDirectory "$SMPROGRAMS\zrfisaac"
	CreateShortcut "$SMPROGRAMS\zrfisaac\Guará.lnk" "$INSTDIR\Guara.exe" "" "$INSTDIR\Guara.ico"

	; # : - Painel de Controle
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "DisplayName" "zrfisaac Guará 1.0.0.0"
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "UninstallString" "$\"$INSTDIR\Uninstall.exe$\""
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "QuietUninstallString" "$\"$INSTDIR\Uninstall.exe$\" /S"
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "InstallLocation" "$\"$INSTDIR$\""
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "DisplayIcon" "$\"$INSTDIR\Guara.ico$\""
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "Publisher" "Isaac Santana / zrfisaac.github.io"
	WriteRegStr HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "DisplayVersion" "1.0.0"
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "VersionMajor" 1
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "VersionMinor" 0
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "NoModify" 0
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "NoRepair" 0
	WriteRegDWORD HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\zrfisaac_guara" "EstimatedSize" 1082 ;KB
SectionEnd

; # - Desinstalador
Section Un.Base
	; # : - Obrigatorio
	SectionIn RO

	; # : - Arquivos
	Delete "$INSTDIR\*.*"
	RMDir /r "$INSTDIR"

	; # : - Atalhos
	Delete "$INSTDIR\Guará.lnk"
	Delete "$SMPROGRAMS\zrfisaac\Guará.lnk"

	; # : - Registros
	DeleteRegKey HKCU "SOFTWARE\zrfisaac\Guara"
	DeleteRegKey HKCU "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\BDE"
SectionEnd
