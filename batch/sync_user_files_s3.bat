::Move Backups databases to AWS s3
::author Sergio Barbosa <sbarbosa115@gmail.com>
C:\"Program Files"\Amazon\AWSCLI\aws.exe s3 mv s3://archive.publicar.com/LoadClicksStatistics/ G:\Files\LoadClicksStatistics --exclude '*' --include '*.txt' --recursive