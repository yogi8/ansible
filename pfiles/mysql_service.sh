#!/bin/sh
# This file was automatically generated
# by the pfSense service handler.

rc_start() {
        # Create DB dir before starting, in case it was removed. Otherwise redis will fail.
        service mysql-server onestart
	service vnstat onestart
      
          


}

rc_stop() {
        # Kill ntopng and redis
        service mysql-server onestop
	service vnstat onestop
}

case $1 in
        start)
                rc_start
                ;;
        stop)
                rc_stop
                ;;
        restart)
                rc_stop
                rc_start
                ;;
esac
