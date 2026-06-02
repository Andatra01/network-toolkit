HOST=$1
PORT=$2
TIMEOUT=2

if nc -zv -w $TIMEOUT $HOST $PORT 2>/dev/null; then #z - проверка портов без отправки данных, v - Подробный вывод w - Таймаут (в секундах) на установку соединения
	echo "OPEN: $HOST:$PORT"
else
	echo "CLOSED: $HOST:$PORT"
fi
