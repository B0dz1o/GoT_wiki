#!/bin/bash

echo 'travis_fold:start:xctool'
xctool
CODE=$?
if [ $CODE -ne 0 ];
then
        CODE=1
fi
echo 'travis_fold:end:xctool'
exit $CODE

