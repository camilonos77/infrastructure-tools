::Compress and upload sourcecode to AWS s3
::author Sergio Barbosa <sbarbosa115@gmail.com>
::version 1.0
@ECHO off 
SET EXTENSION=zip
SET TIMESTAP=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%-%TIME:~0,2%-%TIME:~3,2%

FOR /f %%f IN ('DIR /b D:\Sites') DO (
  C:\"Program Files (x86)"\PeaZip\res\7z\7z.exe a -tzip D:\Backups\%%f_%TIMESTAP%.%EXTENSION% D:\Sites\%%f
)
C:\"Program Files"\Amazon\AWSCLI\aws.exe s3 mv D:\Backups\ s3://UdigBackup/SourceCode --recursive