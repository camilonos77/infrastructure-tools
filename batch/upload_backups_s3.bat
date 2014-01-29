::Move Backups databases to AWS s3
::author Sergio Barbosa <sbarbosa115@gmail.com>
C:\"Program Files"\Amazon\AWSCLI\aws.exe s3 mv G:\Databases s3://UdigBackup/Databases --recursive