#!/bin/bash
# Powered By EndMove - https://www.endmove.eu/ - Jérémi N
# Version used: 1.0.0

SCREEN="demo"                                     # The name of the screen of your minecraft server
NAME="demo"                                       # The name of your minecraft server
START="java -Xincgc -Xms3024M -jar server.jar"    # Startup command for your server
PREFIX="[EndServ]"                                # Prefix of the sh EndServ script
cd "/home/minecraft/demo/"                        # Emplacement de votre serveur minecraft conseillé "(~/home/minecraft/server_name/"

isrunning(){
  if ! screen -list | grep -q "$SCREEN"
  then
    return 1
  else
    return 0
  fi
}

case "$1" in
  version)
    echo "
    $PREFIX is a creation of EndMove
      You are using version: v1.0.0
    "
  ;;

  start)
    if ( isrunning )
    then
      echo "$PREFIX : Server ($NAME) is already  running!"
    else
      echo "$PREFIX : Starting server ($NAME)..."
      screen -dmS $SCREEN $START
    fi
  ;;

  status)
    if ( isrunning )
    then
      echo "$PREFIX : Server ($NAME) is running."
    else
      echo "$PREFIX : Server ($NAME) is not running."
    fi
  ;;

  screen)
    screen -r $SCREEN
  ;;

  reload)
    screen -S $SCREEN -p 0 -X stuff `printf "reload\r"`
    echo "$PREFIX : Server ($NAME) will be restarted."
  ;;

  stop)
    if ( isrunning )
    then
      screen -S $SCREEN -p 0 -X stuff `printf "stop\r"`
      echo "$PREFIX : Stopping server ($NAME)."
    else
      echo "$PREFIX : Server ($NAME) is not running!"
    fi
  ;;

  *)
   echo "$PREFIX Usage : {start|stop|status|screen|reload|version|help}"
  ;;
esac

exit 0