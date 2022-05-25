#!/bin/bash

#input
read 1
target = $1

#echo -e "Crobat is running......\n****************"
#dataset = 'crobat -s $1 > domain.txt'
#echo -e "end\n*****************"
#sleep 1
echo -e "subfinder is running......\n****************"
subfinder = 'subfinder -silent -d $1 > domain.txt'
echo -e "end\n*****************"
sleep 1
echo -e "assetfinder is running......\n****************"
assetfinder = 'assetfinder -subs-only $1 >> domain.txt'
echo -e "end\n*****************"
sleep 1
#echo -e "gau is running......\n****************"
#gauu = 'gau -subs $1 | cut -d / -f3 >> domain.txt'
#echo -e "end\n*****************"
#sleep 1 
if [ -e domain.txt ]
then
  echo -e "massdns is running......\n****************"
  sort -u domain.txt | massdns -r /Desktop/tools/massdns/lists/resolvers.txt -t A -o S -w /Desktop/result.txt
  sleep 1
  cat /Desktop/result.txt | awk '{print $1}' | sed 's/.$//' > /Desktop/result_org.txt
  cat /Desktop/result_org.txt
else
  echo "file not found"
fi