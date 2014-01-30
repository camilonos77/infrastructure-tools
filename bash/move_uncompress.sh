#################################################################
#			List and process line by line.						#
#			author Sergio Barbosa <sbarbosa115@gmail.com>		#
#			version 1.0											#
#################################################################
ls /home/carvajal/public_html/migracion/uploadFiles | while read line; do 
	echo $line
done 