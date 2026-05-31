DATA=$(date '+%Y-%m-%d %H:%M:%S')
LOGFILE="/home/klitvinov/logfile.txt"
echo "$DATA" >> "$LOGFILE"
if ping -c 2 8.8.8.8 &> /dev/null; then
	echo 'Dns гугла пингуется'>> "$LOGFILE"
else
	echo 'alert' >> "$LOGFILE"
fi

if ping -c 2 ya.ru &> /dev/null; then
	echo 'Яндекс пингуется' >> "$LOGFILE"
else
	echo 'Проблемы с инетом' >> "$LOGFILE"
fi
echo 'список открытых портов' >> "$LOGFILE"
ss -tulpn >> "$LOGFILE"
echo 'маршрут по умолчанию' >> "$LOGFILE"
ip route get 8.8.8.8 >> "$LOGFILE"
