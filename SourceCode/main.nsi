!include "ns.nsh"
!include "nsisbass.nsh"
OutFile "setup_sololevelingarise.exe"
SetCompressor /SOLID lzma
Section 01
    SetOutPath "C:\Program Files\SoloLevelingArise"
    File /oname=SoloLevellingDarkAria_MusicalityRemix.mp3 "SoloLevellingDarkAria_MusicalityRemix.mp3"
    !insertmacro NSISBASS_INIT
    !insertmacro NSISBASS_PLAYMUSIC "SoloLevellingDarkAria_MusicalityRemix.mp3" 0 ${BASS_SAMPLE_LOOP}
    File /r "C:\Program Files\Netmarble\Netmarble Game\sololv\*.*"
SectionEnd
