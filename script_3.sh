#!/bin/bash

echo "[ INFO ] Start Hash script uploader ...."

log_disabling=1
function clean {
	[[ -z "$log_disabling" ]] && echo "[ INFO ] Start clean"
	redis-cli KEYS "user:*" | xargs redis-cli DEL > /dev/null
	[[ -z "$log_disabling" ]] && echo "[ INFO ] Clean complete"
}

function generate {
	# Clean result_3 file
	> result_3.txt
	for ((i = 1; i < max_key+1; i++)); do
		echo "HMSET user:${i} KEYFIRST value${i} KEYSECOND value${i} KEYTHIRD value${i}" >> result_3.txt
	done
}

function upload {
	cat result_3.txt | redis-cli --pipe > /dev/null
}

# Entry point
clean


echo "Time for upload 1 000 000 hash"
max_key=1000000
generate
time upload
clean
echo "--------------------------"

echo ""
echo "Time for upload 10 000 000 hash"
max_key=10000000
generate
time upload
clean
echo "--------------------------"


echo "[ INFO ] Script end"