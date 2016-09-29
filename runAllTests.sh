#!/bin/bash

echo 'travis_fold:start:iPhone4s'
bash scripts/ip4s.sh
echo 'travis_fold:end:iPhone4s'

echo 'travis_fold:start:iPhone5s'
bash scripts/ip5s.sh
echo 'travis_fold:end:iPhone5s'

echo 'travis_fold:start:xctool'
xctool
echo 'travis_fold:end:xctool'



