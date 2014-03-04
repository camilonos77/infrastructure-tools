#!/bin/bash
#  ____________.               ___.                        ____ ____ .________
# /   _____/\_ |__ _____ ______\_ |__   ____  ___________ /_   /_   ||   ____/
# \_____  \  | __ \\__  \\_  __ \ __ \ /  _ \/  ___/\__  \ |   ||   ||____  \ 
# /        \ | \_\ \/ __ \|  | \/ \_\ (  <_> )___ \  / __ \|   ||   |/       \
#/_______  / |___  (____  /__|  |___  /\____/____  >(____  /___||___/______  /
#        \/      \/     \/          \/           \/      \/                \/ 
# Move the last modified folder to s3 bucket.
# author Sergio Barbosa <sbarbosa115@gmail.com>
# Version 1.0
cd /backupnew
ls -d --sort=time */ | head -n 1 | while read line; do
       aws s3 sync $line s3://UdigBackup/cpanel-produccion-html/$line
done