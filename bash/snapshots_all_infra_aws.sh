#################################################################
#  ____________.               ___.                        ____ ____ .________
# /   _____/\_ |__ _____ ______\_ |__   ____  ___________ /_   /_   ||   ____/
# \_____  \  | __ \\__  \\_  __ \ __ \ /  _ \/  ___/\__  \ |   ||   ||____  \ 
# /        \ | \_\ \/ __ \|  | \/ \_\ (  <_> )___ \  / __ \|   ||   |/       \
#/_______  / |___  (____  /__|  |___  /\____/____  >(____  /___||___/______  /
#        \/      \/     \/          \/           \/      \/                \/ 
#################################################################
instancesWithoutSnapshot=('i-79713058' 'i-4e55856f' 'i-28ce7009' 'i-54333c74' 'i-fc5a57dc' 'i-176ff66d' 'i-d4eedeaf')
ownerAccountId="067783426737"
aws --profile unidad_digital ec2 describe-instances --filters Name=owner-id,Values=$ownerAccountId | jq -r ".Reservations[].Instances[].BlockDeviceMappings[].Ebs.VolumeId" | while read line; do
	instaceId=$(aws --profile unidad_digital ec2 describe-volumes --volume-id $line | jq -r ".Volumes[].Attachments[].InstanceId")
	if ! [[ ${instancesWithoutSnapshot[*]} =~ "$instaceId" ]] ; then
		aws --profile unidad_digital ec2 create-snapshot --volume-id $line
	fi
done