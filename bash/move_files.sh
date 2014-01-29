cat "users.txt" | while read line; do 
	IFS=';' read -a vars <<< "${line}"
	DIIRECTORY=/home/${vars[0]}/
	if [ -d "$DIIRECTORY" ]; then
	
		if [ -f /home/carvajal/public_html/migracion/uploadFiles/${vars[1]} ]; then
		
			rm -r -f /home/${vars[0]}/public_html/*
	
			cp ./lib/* /home/${vars[0]}/public_html/
			cp  /home/carvajal/public_html/migracion/uploadFiles/${vars[1]} /home/${vars[0]}/public_html/
			unzip /home/${vars[0]}/public_html/${vars[1]} -d /home/${vars[0]}/public_html/
			chown -R ${vars[0]}:${vars[0]} /home/${vars[0]}/public_html/*
			rm /home/${vars[0]}/public_html/${vars[1]}
		
		else
			echo "No Zip no existe;" ${vars[1]} >> ./result
		fi
	else
		echo "No Cuenta no existe;" ${vars[0]} >> ./result
	fi
done 