#   ZSh Config: Settings
# ========================

# Movement
setopt autoCD autoPushD noCDableVars noChaseDots noChaseLinks noPOSIXCD pushdIgnoreDups pushdMinus pushdSilent pushdToHome

# History
export HISTFILE=$HOME/.cache/zsh-history
export SAVEHIST=25000
export HISTSIZE=30000
setopt appendHistory bangHist extendedHistory histAllowClobber histBeep noHistExpireDupsFirst histFCNTLLock noHistFindNoDups noHistIgnoreAllDups noHistIgnoreDups histIgnoreSpace histLexWords noHistNoFunctions histNoStore histReduceBlanks histSaveByCopy noHistSaveNoDups histVerify noIncAppendHistory noIncAppendHistoryTime shareHistory

# I/O
setopt aliases clobber noCorrect noCorrectAll dvorak noFlowControl noIgnoreEOF interactiveComments noHashCmds noHashDirs noHashExecutablesOnly mailWarning pathDirs noPathScript noPrintEightBit noPrintExitValue RCQuotes noRmStarSilent noRmStarWait shortLoops noSunKeyboardHack

# Job Control
setopt autoContinue noAutoResume bgNice checkJobs hup longListJobs monitor notify noPOSIXJobs checkRunningJobs

