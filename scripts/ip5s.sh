#!/bin/bash

echo 'travis_fold:start:iPhone5s'
xcodebuild test \
 -workspace "GoT_wiki.xcworkspace" \
 -scheme travisUI \
 -destination 'platform=iOS Simulator,name=iPhone 5S,OS=9.3' 
CODE=$?
if [ $CODE -ne 0 ];
then
	CODE=1
fi
echo 'travis_fold:start:iPhone5s'
exit $CODE



