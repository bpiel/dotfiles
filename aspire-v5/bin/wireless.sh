#!/bin/sh

iwconfig wlan0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`iwconfig wlan0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`iwconfig wlan0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
ison=`iwconfig wlan0 | awk -F '=' '/Tx-Power/ {print $2}'`
bars=`expr $stngth / 10`

if [ $ison = "off" ]; then
 echo "wireless off"
else

case $bars in
  0)  bar='[__________]' ;;
  1)  bar='[1_________]' ;;
  2)  bar='[2>________]' ;;
  3)  bar='[3=>_______]' ;;
  4)  bar='[4==>______]' ;;
  5)  bar='[5===>_____]' ;;
  6)  bar='[6====>____]' ;;
  7)  bar='[7=====>___]' ;;
  8)  bar='[8======>__]' ;;
  9)  bar='[9=======>_]' ;;
  10) bar='[10=======>]' ;;
  *)  bar='[____:(____]' ;;
esac

echo $essid $bar

fi

exit 0
