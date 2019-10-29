
Section "GetI2P"
  SetOutPath $INSTDIR
    IfFileExists "$PROGRAMFILES\i2p\i2p.exe" endGetI2P checkI2PD
    Goto beginChooseRouterType
  checkI2PD:
    IfFileExists "$PROGRAMFILES\i2pd\i2pd.exe" endGetI2P beginChooseRouterType
  beginChooseRouterType:
    MessageBox MB_YESNO "Your system does not appear to have i2p installed. An i2p router is required to use this software.$\n$\n We recommend the Java I2P router for most users. If you have a Java Virtual Machine installed, please click yes below. If you do not have a JVM installed, or you don't want to use Java I2P, please click No below.$\n$\nDo you have a Java Virtual Machine installed?" IDYES beginGetI2P IDNO beginGetI2PD
  beginGetI2P:
    MessageBox MB_YESNO "Your system does not appear to have i2p installed.$\n$\nDo you wish to install it now?" IDNO beginGetI2PD
    File "i2pinstaller.exe"
    ExecWait "$INSTDIR\i2pinstaller.exe"
    SetOutPath "$PROGRAMFILES\i2p"
    File "clients.config"
    SetOutPath "C:\\ProgramData\i2p"
    File "clients.config"
    SetOutPath "$AppData\I2P"
    File "clients.config"
    Goto endGetI2P
  beginGetI2PD:
    MessageBox MB_YESNO "Your system does not appear to have i2pd installed.$\n$\nDo you wish to install it now?" IDNO endGetI2P
    File "i2pdinstaller.exe"
    ExecWait "$INSTDIR\i2pdinstaller.exe"
    SetOutPath "$PROGRAMFILES\i2pd"
    File "i2pd.conf"
    SetOutPath "$PROGRAMFILES64\i2pd"
    File "i2pd.conf"
    SetOutPath "C:\\ProgramData\i2pd"
    File "i2pd.conf"
    SetOutPath "$AppData\i2pd\"
    File "i2pd.conf"
  endGetI2P:
SectionEnd
