#!/bin/bash
#################################################################
#  ____________.               ___.                        ____ ____ .________
# /   _____/\_ |__ _____ ______\_ |__   ____  ___________ /_   /_   ||   ____/
# \_____  \  | __ \\__  \\_  __ \ __ \ /  _ \/  ___/\__  \ |   ||   ||____  \ 
# /        \ | \_\ \/ __ \|  | \/ \_\ (  <_> )___ \  / __ \|   ||   |/       \
#/_______  / |___  (____  /__|  |___  /\____/____  >(____  /___||___/______  /
#        \/      \/     \/          \/           \/      \/                \/ 
#			Make Backups ec2 volumes instances.					
#			author Sergio Barbosa <sbarbosa115@gmail.com>		
#			version 1.0											
#################################################################

# Autentication source database. 
FROM_DATABASE_NAME=citypoints
FROM_DATABASE_USER=root
FORM_DATABASE_PASS="root"

# Autentication destination database. 
TO_DATABASE_NAME=citypoints_bk
TO_DATABASE_USER=root
TO_DATABASE_PASS="root"

ERROR=/tmp/duplicate_mysql_error.log
echo "Droping '$TO_DATABASE_NAME' and generating it from '$FROM_DATABASE_NAME' dump"
mysql -u$TO_DATABASE_USER -p$TO_DATABASE_PASS -e "DROP DATABASE $TO_DATABASE_NAME;" --force && mysql -u$TO_DATABASE_USER -p$TO_DATABASE_PASS -e "CREATE DATABASE $TO_DATABASE_NAME;" && mysqldump --force --log-error=$ERROR -u$FROM_DATABASE_USER -p$FORM_DATABASE_PASS $FROM_DATABASE_NAME | mysql -u$TO_DATABASE_USER -p$TO_DATABASE_PASS $TO_DATABASE_NAME
