#!/bin/bash

while true
do
        read -p "Input: " input
        case $input in
                "CPU") lscpu | grep "Model name" | awk '{print $3,$4,$5,$6,$7}'
                        ;;
                "RAM") free -h | grep "Mem" | awk '{print $2}'
                        free -h | grep "Swap" | awk '{print $2}'
                        ;;
                "Storage") fdisk -l | grep "Disk /dev/sda" | awk '{print $3,$4}'
                        ;;
                "All") lscpu free -h fdisk
                        ;;
                *) eval "$input"
        esac
done
