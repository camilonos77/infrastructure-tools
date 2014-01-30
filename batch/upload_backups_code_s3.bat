::Compress and upload sourcecode to AWS s3
::author Sergio Barbosa <sbarbosa115@gmail.com>
::version 1.0
@ECHO off
SET EXTENSION=zip
SET TIMESTAMP=%date:~7,2%_%date:~3,3%_%date:~10,4%_%time:~0,2%_%time:~3,2%
::Clean string TIMESTAMP
SET TIMESTAMP=%TIMESTAMP: =%

FOR /f %%f IN ('DIR /b D:\Sites') DO (
  C:\"Program Files (x86)"\PeaZip\res\7z\7z.exe a -tzip D:\Backups\%%f_%TIMESTAMP%.%EXTENSION% D:\Sites\%%f
)
C:\"Program Files"\Amazon\AWSCLI\aws.exe s3 mv D:\Backups\ s3://UdigBackup/SourceCode --recursive