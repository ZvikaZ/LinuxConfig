###################################################
#      SOME SETTINGS FOR THE SYSTEM ENVIRONMENT   #
###################################################
stty quit  
stty erase  
mesg y

clear

setenv TERM_INGRES "vt100f"
setenv TERM "vt100"
set term = "vt100"

echo "+++++++++++++++++++++++++++++++++++"
if (-e /tmp/$USER) then
  echo "+ /tmp/$USER    : EXIST."
else
  mkdir -p /tmp/$USER/netscape/cache
  rm -rf ${HOME}/.netscape/cache
  chmod 700 /tmp/$USER
  echo "+ /tmp/$USER    : CREATED."
endif

if (-e .config/display) then
    echo "+ FILE .config/display    : EXIST"
    setenv DISPLAY `cat ~/.config/display`
    echo -n "+ DISPLAY IS SET TO       : "
    echo -n "[1m"
    echo "$DISPLAY"
    echo -n "[0m"
else
    echo "+ FILE .config/display    : NOT CREATED"
    if ("$?REMOTEHOST" != 0) then 
        setenv DISPLAY $REMOTEHOST":0.0"
        echo -n "+ DISPLAY IS SET TO       : "
        echo -n "[1m"
        echo "$DISPLAY"
        echo -n "[0m"
    else
        echo "+ DISPLAY NOT SET"
    endif
endif

echo -n "+ Permission is           : "
echo -n "[1m"
/bin/ls -ld $HOME | awk '{print $1}'
echo -n "[0m"
echo "+--------------------------------------"
echo "+              .rhosts :"
awk '{printf "+   %s\n",$0}' ~/.rhosts
echo "+++++++++++++++++++++++++++++++++++++++"
