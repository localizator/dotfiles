#!/bin/sh
conkyscripts=$HOME/.config/conky

ip()
{
wget http://checkip.dyndns.org/ -q -O - |
grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>'
}

fuck()
{
echo -e `curl -s  http://fucking-great-advice.ru/api/random | awk -F \" '{print $8}'` |sed 's/\&nbsp;/ /g'
}

hd()
{
cd $conkyscripts
$PYTHONPATH /usr/bin/python $conkyscripts/hd.py "$@"
}

forecast()
{
cd $conkyscripts
$PYTHONPATH /usr/bin/python $conkyscripts/forecast.py "$@"
}

case "$1" in
  -ip)
        ip
        ;;
  -hd)
        hd
        ;;
  -fuck)
        fuck
        ;;
  -forecast)
        forecast
        ;;
  *)
	echo "Scrips"

	exit 1
esac
