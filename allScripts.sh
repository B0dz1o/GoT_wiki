#!/bin/bash

travis_time_start() {
  travis_timer_id=$(printf %08x $(( RANDOM * RANDOM )))
  travis_start_time=$(travis_nanoseconds)
  echo "travis_time:start:$travis_timer_id"
}

travis_time_finish() {
  local result=$?
  travis_end_time=$(travis_nanoseconds)
  local duration=$(($travis_end_time-$travis_start_time))
  echo  "\ntravis_time:end:$travis_timer_id:start=$travis_start_time,finish=$travis_end_time,duration=$duration"
  return $result
}

function travis_nanoseconds() {
  local cmd="date"
  local format="+%s%N"
  local os=$(uname)

  if hash gdate > /dev/null 2>&1; then
    cmd="gdate" # use gdate if available
  elif [[ "$os" = Darwin ]]; then
    format="+%s000000000" # fallback to second precision on darwin (does not support %N)
  fi

  $cmd -u $format
}


# Unit testing
travis_time_start
bash scripts/xct.sh
travis_time_finish
if [ $? -ne 0];
then
        exit 1
fi

#UI tests for iPhone 4S
bash scripts/ip4s.sh
if [ $? -ne 0 ];
then
	exit 1
fi

#UI tests for iPhone 5S
bash scripts/ip5s.sh
if [ $? -ne 0 ];
then
	exit 1
fi
exit 0
