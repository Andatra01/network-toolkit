HOSTS=("8.8.8.8" "ya.ru" "github.com")
LOGFILE="/home/klitvinov/network-toolkit/log.txt"
INTERVAL=10  # секунд

while true; do
    DATE=$(date '+%Y-%m-%d %H:%M:%S')
    for host in "${HOSTS[@]}"; do
        if ping -c 1 -W 2 $host &>/dev/null; then
            echo "$DATE OK $host" >> $LOGFILE
        else
            echo "$DATE FAIL $host" >> $LOGFILE
            echo 'Покажи вывод' > log-nework.txt
        fi
    done
    sleep $INTERVAL
done
