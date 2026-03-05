!define APP_NAME "FirmaDigitalISSET"
!define APP_VERSION "1.0.0"
!define COMPANY_NAME "ISSET"
!define INSTALL_DIR "$PROGRAMFILES\FirmaDigitalISSET"

OutFile "FirmaDigitalISSET-installer.exe"
InstallDir "${INSTALL_DIR}"
RequestExecutionLevel admin

Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "Instalar FirmaDigitalISSET"

    ; ==============================
    ; 🔹 BORRAR SOLO LA CARPETA HELP
    ; ==============================
    RMDir /r "$PROFILE\.afirma\Autofirma\help"

    SetOutPath "$INSTDIR"

    File "..\FirmaDigitalISSET.exe"

    CreateDirectory "$INSTDIR\media"
    CreateDirectory "$INSTDIR\media\logo"
    CreateDirectory "$INSTDIR\media\cert"
    CreateDirectory "$INSTDIR\bin"

    File /r "..\media\*"
    File /r "..\bin\*"

    SetOutPath "$INSTDIR\jre"
    File /r "..\jre\*"

    CreateShortCut "$DESKTOP\FirmaDigitalISSET.lnk" "$INSTDIR\FirmaDigitalISSET.exe"
    CreateShortCut "$SMPROGRAMS\FirmaDigitalISSET.lnk" "$INSTDIR\FirmaDigitalISSET.exe"

    WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd


Section "Uninstall"

    Delete "$DESKTOP\FirmaDigitalISSET.lnk"
    Delete "$SMPROGRAMS\FirmaDigitalISSET.lnk"

    ; ==============================
    ; 🔹 BORRAR SOLO HELP AL DESINSTALAR
    ; ==============================
    RMDir /r "$PROFILE\.afirma\Autofirma\help"

    RMDir /r "$INSTDIR"

SectionEnd