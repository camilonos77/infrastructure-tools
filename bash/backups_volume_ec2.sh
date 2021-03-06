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
VolumenId=('vol-4ca21801' 'vol-b2ad17ff' 'vol-a8ad17e5' 'vol-a9ad17e4' 'vol-aead17e3' 'vol-b18c35fc');
for item in ${VolumenId[*]}
do
    printf "   %s\n" $item
	aws --profile unidad_digital ec2 create-snapshot $item
done
