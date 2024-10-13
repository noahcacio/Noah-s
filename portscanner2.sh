#!/bin/bash

pre=$1
file=$2
first=1
end=254
echo "ip,port"
        # building my IP
	for last_octet in $(seq $first $end); do
	        fullip="${pre}${last_octet}"
		if timeout .1 bash -c "echo >/dev/tcp/$fullip/$file" 2>/dev/null; then
		    echo "The Ip $fullip has the following open port,port $file"
	        else
		   # echo "The IP $fullip has no open DNS port"
		    #Un comment line above to see Ip's with no DNS
		       continue
	        fi
        done
