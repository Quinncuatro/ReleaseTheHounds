#!/bin/bash

# Set up vars
HOODLUMTYPES="Thief Ruffian Hooligan Delinquent Vandal"
WHALETYPES="123Fin 456_Gray 495Beluga 385_Livyatan 012_Blue 978Bowhead 149_Humpback 163Killer"
SANITIZEDWHALES=""
JAILTYPES="Juvenile Town Military Federal County State Minimum"

function whaleSanitizer {
  input=$1
  input=`echo $input | sed 's/^[0-9]*//'`
  input=`echo $input | sed 's/^_*//'`
  echo $input
}

# A HOODLUMS
cd /opt/hoodlums/
for i in $HOODLUMTYPES; do shred -n 7 -u -v *$i.zip; done;

# B WHALES
for i in $WHALETYPES; do
  SANITIZEDWHALES="$SANITIZEDWHALES $(whaleSanitizer $i)"
done;

cd /var/lib/docker/
for i in $SANITIZEDWHALES; do shred -n 7 -u -v *$i.yaml; done;

# C JAILS
cd /etc/fail2ban/
for i in $JAILTYPES; do shred -n 7 -u -v $i*; done;

echo "------------------------------";
echo "LEFTOVER FILES IN /opt/Hoodlums/";
ls /opt/hoodlums/;
echo "------------------------------";
echo "LEFTOVER FILES IN /var/lib/docker/";
ls /var/lib/docker/;
echo "------------------------------";
echo "LEFTOVER FILES IN /etc/fail2ban/";
ls /etc/fail2ban/;
echo "------------------------------";

exit 1;