HOST=$1
START=$2
END=$3

echo 'Сканирую $HOST порты $START-$END....'
for port in $(seq $START $END); do
	if nc -zv -w 1 $HOST $port 2>/dev/null; then
		echo " OPEN: $port"
	fi
done
echo 'Готово'
