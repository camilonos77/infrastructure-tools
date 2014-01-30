 #!/bin/bash
 # Move the last modified folder to s3 bucket.
 # author Sergio Barbosa <sbarbosa115@gmail.com>
 # Version 1.0
 cd /backupnew
 ls -d --sort=time */ | head -n 1 | while read line; do
        aws s3 sync $line s3://UdigBackup/WebSitesCpanel/$line