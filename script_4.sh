#!/bin/bash
log_disabling=1

echo "[ INFO ] Start image uploader script...."
img="$(cat image.jpg | base64 -w 0)"

function clean {
	[[ -z "$log_disabling" ]] && echo "[ INFO ] Start clean"
	redis-cli KEYS "user:*" | xargs redis-cli DEL > /dev/null
	[[ -z "$log_disabling" ]] && echo "[ INFO ] Clean complete"
}

function generate {
	# Clean generated file
	> result_4.txt
	for ((i = 1; i < max_keys+1; i++)); do
		echo "SET user:${i} ${img}" >> result_4.txt
	done
}

function upload {
	cat result_4.txt | redis-cli --pipe > /dev/null
}

# Entry point
clean

echo "Time for upload 100 000 string row"
max_keys=100000
generate
time upload
echo "--------------------------"
echo ""

echo "Time for upload 1 000 000 string row"
max_keys=500000
generate
time upload
echo "--------------------------"
echo ""

echo "[ INFO ] Script end"
