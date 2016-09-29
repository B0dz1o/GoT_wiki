#!/bin/bash

bash scripts/ip4s.sh
if [ $? -ne 0 ];
then
	exit 1
fi
bash scripts/ip5s.sh
if [ $? -ne 0 ];
then
	exit 1
fi
bash scripts/xct.sh
if [ $? -ne 0];
then
	exit 1
fi
exit 0
