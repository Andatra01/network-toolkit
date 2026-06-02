HOST=$1
PORTS=(6443 2379 2380 10250 10251 10252)

echo "Проверка портов Kubernetes на хосте $HOST ..."
for port in "${PORTS[@]}"; do
    if nc -zv -w 1 "$HOST" "$port" 2>/dev/null; then
        echo "Open: $port"
    else
        echo "Closed: $port"
    fi
done

NODEPORT=30000
if nc -zv -w 1 "$HOST" $NODEPORT 2>/dev/null; then
    echo "Open (NodePort start): $NODEPORT"
else
    echo "Closed (NodePort start): $NODEPORT"
fi

echo "Готово"
