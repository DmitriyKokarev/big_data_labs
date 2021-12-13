#!/bin/bash
echo " [ INFO ] Start str uploading script...."
log_disabling=1
function restarting {
	[[ -z "$log_disabling" ]] && echo "[ INFO ] Start restarting..."
	redis-cli KEYS "user:*" | xargs redis-cli DEL > /dev/null
	[[ -z "$log_disabling" ]] && echo "[ INFO ] restarting completed.."
}
function creating {
	> result.txt
	for ((i = 1; i < maxval+1; i++)); do
		echo "SET user:${i} someValue${i}" >> result.txt
	done
}
function upload {
	cat result.txt | redis-cli --pipe > /dev/null
}
echo "Time for upload 1 000 000 strings ..."
maxval=1000000
creating
time upload
restarting
echo "--------------------------"
echo ""
echo "Time for upload 10 000 000 strings ..."
maxval=10000000
creating
time upload
restarting
echo "--------------------------"

echo "[ INFO ] Script finshed"