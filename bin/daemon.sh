#!/bin/sh

HUBOT_ROOT="."
HUBOT_HOME="$HUBOT_ROOT/node_modules/hubot"
DAEMON="$HUBOT_ROOT/bin/hubot"
PIDFILE=$HUBOT_ROOT/hubot.pid

case "$1" in
start)
        echo "Starting"
        /sbin/start-stop-daemon --start --background --pidfile $PIDFILE --make-pidfile -d $HUBOT_ROOT --exec $DAEMON
        echo "."
        ;;
debug)
        echo "Debug mode: no backgrounding"
        /sbin/start-stop-daemon --start --pidfile $PIDFILE --make-pidfile -d $HUBOT_ROOT --exec $DAEMON
        echo "."
        ;;        
stop)
        echo "Stopping"
        /sbin/start-stop-daemon --stop --pidfile $PIDFILE
        echo "."
        ;;  
restart)
        echo "Restarting"
        /sbin/start-stop-daemon --stop --pidfile $PIDFILE
        /sbin/start-stop-daemon --start --pidfile $PIDFILE --make-pidfile --background -d $HUBOT_ROOT --exec $DAEMON
        echo "."
        ;;


    *)
        echo "Usage: $0 {start|stop|restart|debug}" >&2
        exit 1
        ;;  
    esac
    exit
