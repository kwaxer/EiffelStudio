# Microsoft Developer Studio Project File - Name="wkbench" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=wkbench - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "wkbench.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wkbench.mak" CFG="wkbench - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wkbench - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "wkbench - Win32 traditional" (based on "Win32 (x86) Static Library")
!MESSAGE "wkbench - Win32 mt" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe

!IF  "$(CFG)" == "wkbench - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I ".." /I "..\.." /I "..\..\ipc\app" /I "..\..\console" /D "_DEBUG" /D "WORKBENCH" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wkbench - Win32 traditional"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "traditional"
# PROP BASE Intermediate_Dir "traditional"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ""
# PROP Intermediate_Dir "traditional"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /GX /O2 /D "WORKBENCH" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "wkbench - Win32 mt"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "mt"
# PROP BASE Intermediate_Dir "mt"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ""
# PROP Intermediate_Dir "mt"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MT /GX /O2 /D "WORKBENCH" /D "EIF_THREADS" /YX /FD /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo /o"mtwkbench.bsc"
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo /out:"mtwkbench.lib"

!ENDIF 

# Begin Target

# Name "wkbench - Win32 Debug"
# Name "wkbench - Win32 traditional"
# Name "wkbench - Win32 mt"
# Begin Source File

SOURCE=..\argv.c
# End Source File
# Begin Source File

SOURCE=..\bexcept.c
# End Source File
# Begin Source File

SOURCE=..\bits.c
# End Source File
# Begin Source File

SOURCE=..\bmain.c
# End Source File
# Begin Source File

SOURCE=..\boolstr.c
# End Source File
# Begin Source File

SOURCE=..\cecil.c
# End Source File
# Begin Source File

SOURCE=..\compress.c
# End Source File
# Begin Source File

SOURCE=..\console.c
# End Source File
# Begin Source File

SOURCE=..\copy.c
# End Source File
# Begin Source File

SOURCE=..\debug.c
# End Source File
# Begin Source File

SOURCE=..\dir.c
# End Source File
# Begin Source File

SOURCE=..\dle.c
# End Source File
# Begin Source File

SOURCE=..\eif_cond_var.c
# End Source File
# Begin Source File

SOURCE=..\eif_once.c
# End Source File
# Begin Source File

SOURCE=..\eif_threads.c
# End Source File
# Begin Source File

SOURCE=..\equal.c
# End Source File
# Begin Source File

SOURCE=..\error.c
# End Source File
# Begin Source File

SOURCE=..\except.c
# End Source File
# Begin Source File

SOURCE=..\file.c
# End Source File
# Begin Source File

SOURCE=..\garcol.c
# End Source File
# Begin Source File

SOURCE=..\hash.c
# End Source File
# Begin Source File

SOURCE=..\hashin.c
# End Source File
# Begin Source File

SOURCE=..\hector.c
# End Source File
# Begin Source File

SOURCE=..\internal.c
# End Source File
# Begin Source File

SOURCE=..\interp.c
# End Source File
# Begin Source File

SOURCE=..\lmalloc.c
# End Source File
# Begin Source File

SOURCE=..\local.c
# End Source File
# Begin Source File

SOURCE=..\main.c
# End Source File
# Begin Source File

SOURCE=..\malloc.c
# End Source File
# Begin Source File

SOURCE=..\math.c
# End Source File
# Begin Source File

SOURCE=..\memory.c
# End Source File
# Begin Source File

SOURCE=..\misc.c
# End Source File
# Begin Source File

SOURCE=..\object_id.c
# End Source File
# Begin Source File

SOURCE=..\option.c
# End Source File
# Begin Source File

SOURCE=..\out.c
# End Source File
# Begin Source File

SOURCE=..\path_name.c
# End Source File
# Begin Source File

SOURCE=..\pattern.c
# End Source File
# Begin Source File

SOURCE=..\plug.c
# End Source File
# Begin Source File

SOURCE=..\retrieve.c
# End Source File
# Begin Source File

SOURCE=..\run_idr.c
# End Source File
# Begin Source File

SOURCE=..\search.c
# End Source File
# Begin Source File

SOURCE=..\sig.c
# End Source File
# Begin Source File

SOURCE=..\store.c
# End Source File
# Begin Source File

SOURCE=..\string.c
# End Source File
# Begin Source File

SOURCE=..\timer.c
# End Source File
# Begin Source File

SOURCE=..\tools.c
# End Source File
# Begin Source File

SOURCE=..\traverse.c
# End Source File
# Begin Source File

SOURCE=..\umain.c
# End Source File
# Begin Source File

SOURCE=..\update.c
# End Source File
# Begin Source File

SOURCE=..\urgent.c
# End Source File
# Begin Source File

SOURCE=..\wbench.c
# End Source File
# End Target
# End Project
