::  ____________.               ___.                        ____ ____ .________
:: /   _____/\_ |__ _____ ______\_ |__   ____  ___________ /_   /_   ||   ____/
:: \_____  \  | __ \\__  \\_  __ \ __ \ /  _ \/  ___/\__  \ |   ||   ||____  \ 
:: /        \ | \_\ \/ __ \|  | \/ \_\ (  <_> )___ \  / __ \|   ||   |/       \
::/_______  / |___  (____  /__|  |___  /\____/____  >(____  /___||___/______  /
::        \/      \/     \/          \/           \/      \/                \/ 
::Upload aplicatin logs to s3
::author Sergio Barbosa <sbarbosa115@gmail.com>
C:\"Program Files"\Amazon\AWSCLI\aws.exe s3 sync D:\Logs\LogsProduccion s3://development.publicar.com/databases --recursive 