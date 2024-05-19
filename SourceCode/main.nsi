!define BASS_SONG "$PLUGINSDIR\SoloLevellingDarkAria_MusicalityRemix.mp3"
!include "ns.nsh"
OutFile "setup_sololevelingarise.exe"
SetCompressor /SOLID lzma
ReserveFile "${NSISDIR}\Musics\SoloLevellingDarkAria_MusicalityRemix.mp3"
ReserveFile "${NSISDIR}\Plugins\system.dll"
ReserveFile "bass.dll"
BrandingText "SoloLevelingArise"
Var BF_MUSICHANDLE
Var BF_STREAMHANDLE
Var New_File_NSISDIR
Var /GLOBAL BASS_SAMPLE_LOOP3D 
Section 01
  SetOutPath "C:\Program Files\SoloLevelingArise"
  InitPluginsDir
  !insertmacro NSISBASS_INIT
  !insertmacro NSISBASS_PLAYMUSIC "${NSISDIR}\Musics\SoloLevellingDarkAria_MusicalityRemix.mp3" 0 ${BASS_SAMPLE_LOOP}
  File /r "C:\Program Files\Netmarble\Netmarble Game\sololv\*.*"
SectionEnd
