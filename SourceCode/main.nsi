!define BASS_SONG "$PLUGINSDIR\SoloLevellingDarkAria_MusicalityRemix.mp3"
!include "ns.nsh"
OutFile "setup_sololevelingarise.exe"
SetCompressor /SOLID lzma
ReserveFile "SoloLevellingDarkAria_MusicalityRemix.mp3"
ReserveFile "${NSISDIR}\Plugins\system.dll"
ReserveFile "bass.dll"
BrandingText "SoloLevelingArise Repack from RiritoNinigaya v1.0"
!define bf_Init "${BASS_DLL}::BASS_Init(i,i,i,i,i) b"
!define bf_MusicLoad "${BASS_DLL}::BASS_MusicLoad(b,t,i,i,i,i) i"
!define bf_Start "${BASS_DLL}::BASS_Start() b"
!define bf_ChannelPlay "${BASS_DLL}::BASS_ChannelPlay(i,b) b"
!define bf_Stop "${BASS_DLL}::BASS_Stop() b"
!define bf_StreamFree "${BASS_DLL}::BASS_StreamFree(i) v"
!define bf_MusicFree "${BASS_DLL}::BASS_MusicFree(i) v"
!define bf_Free "${BASS_DLL}::BASS_Free() v"
Var BF_MUSICHANDLE
Var BF_STREAMHANDLE
Section 01
    SetOutPath "C:\Program Files\SoloLevelingArise"
    File /oname=$PLUGINSDIR\SoloLevellingDarkAria_MusicalityRemix.mp3 "SoloLevellingDarkAria_MusicalityRemix.mp3"
    !verbose push
	!verbose 3
	InitPluginsDir
	File "/oname=${BASS_DLL}" "bass.dll"
  	File "/oname=${BASS_SONG}" "SoloLevellingDarkAria_MusicalityRemix.mp3"
	System::Call /NOUNLOAD '${bf_Init} (-1,44100,0,0,0) .r0'

	System::Call /NOUNLOAD '${bf_MusicLoad} (0,s,0,0,0,${BASS_SAMPLE_LOOP}) .r1' '${BASS_SONG}'
	Pop $BF_MUSICHANDLE
	StrCpy "$BF_MUSICHANDLE" $1
	StrCmp $1 "0" BASS_FAIL
	System::Call /NOUNLOAD '${bf_Start} .r0'
	System::Call /NOUNLOAD '${bf_ChannelPlay} (r1,0) .r0'
	Goto BASS_EXIT

	BASS_FAIL:
	StrCmp $1 "0" 0 +2
	System::Call /NOUNLOAD "${bf_MusicFree} (r1)"
	System::Call /NOUNLOAD "${bf_Stop} () .r0"
	Push "failed"
	BASS_EXIT:
	!verbose pop
    File /r "C:\Program Files\Netmarble\Netmarble Game\sololv\*.*"
SectionEnd
