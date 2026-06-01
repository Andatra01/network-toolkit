#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 IP/префикс  (пример: 192.168.1.115/24)"
    exit 1
fi

full="$1"
ip_part="${full%/*}"
prefix="${full#*/}"

IFS='.' read -r a b c d <<< "$ip_part"

ip_num=$(( a * 256*256*256 + b * 256*256 + c * 256 + d ))

block=$(( 1 << (32 - prefix) ))

network=$(( (ip_num / block) * block ))

broadcast=$(( network + block - 1 ))

first_host=$(( network + 1 ))
last_host=$(( broadcast - 1 ))

if [ $block -gt 2 ]; then
    hosts=$(( block - 2 ))
else
    hosts=0
fi

int_to_ip() {
    local num=$1
    local o1=$(( num / 256 / 256 / 256 ))
    local o2=$(( (num / 256 / 256) % 256 ))
    local o3=$(( (num / 256) % 256 ))
    local o4=$(( num % 256 ))
    echo "$o1.$o2.$o3.$o4"
}

mask_num=$(( 4294967295 - (block - 1) ))
mask_ip=$(int_to_ip $mask_num)

echo "Сеть:          $(int_to_ip $network)"
echo "Broadcast:     $(int_to_ip $broadcast)"
echo "Первый хост:   $(int_to_ip $first_host)"
echo "Последний хост: $(int_to_ip $last_host)"
echo "Количество хостов: $hosts"
echo "Маска:         $mask_ip"
