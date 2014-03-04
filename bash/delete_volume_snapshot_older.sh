#################################################################
#  ____________.               ___.                        ____ ____ .________
# /   _____/\_ |__ _____ ______\_ |__   ____  ___________ /_   /_   ||   ____/
# \_____  \  | __ \\__  \\_  __ \ __ \ /  _ \/  ___/\__  \ |   ||   ||____  \ 
# /        \ | \_\ \/ __ \|  | \/ \_\ (  <_> )___ \  / __ \|   ||   |/       \
#/_______  / |___  (____  /__|  |___  /\____/____  >(____  /___||___/______  /
#        \/      \/     \/          \/           \/      \/                \/ 
#			Delete snapshot volume from 3 days older			
#			author Sergio Barbosa <sbarbosa115@gmail.com>		
#			version 1.0											
#################################################################
beforeMonth=$(date --date='-2 day' +'%Y-%m-%d')
dateTime="$beforeMonth"
ownerAccountId="067783426737"
echo $beforeMonth
aws --profile unidad_digital ec2 describe-snapshots --filters Name=owner-id,Values=$ownerAccountId | jq -r ".Snapshots[]" | while read line; do 
	OIFS="$IFS"
	IFS=':'
	read -a currentLine <<< "${line}"
	IFS="$OIFS"
	if [[ ${currentLine[0]} == *SnapshotId* ]]; then
		intanceId=$(echo ${currentLine[1]} | tr -d '"' | tr -d ',')
	fi
	
	if [[ ${currentLine[1]} == *$dateTime* ]]; then
		aws ec2 delete-snapshot --snapshot-id $intanceId
	fi
done