#!/bin/csh

set PREFIX="/var/etc/"

cd ${PREFIX}
set STATE=`ls nginx-*-CaptivePortal.conf`

if ( -f /usr/local/www/cportal_ports.php ) then
    echo "File exists, removing old file"
    rm -fr /usr/local/www/cportal_ports.php
else
    echo "No Such file"
endif

foreach i ($STATE)
	awk '/listen/ {print $2}' $i| head -n 1 | sed 's/.$//' > PORT
	set PORT=`cat PORT`
	awk -F 'nginx-|-CaptivePortal' '{print $2}' $i > FLOOR
	set FLOOR=`cat FLOOR`
	echo $FLOOR $PORT >>& /usr/local/www/cportal_ports.php 
end
