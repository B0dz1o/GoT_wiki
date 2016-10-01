#!/bin/bash

echo 'travis_fold:start:Integration testing'
xcodebuild test \
 -workspace "GoT_wiki.xcworkspace" \
 -scheme IntegrationTesting \
 -destination 'platform=iOS Simulator,name=iPhone 5S,OS=9.3' \
 |xcpretty
CODE=$?
if [ $CODE -ne 0 ];
then
	CODE=1
fi
echo 'travis_fold:end:Integration testing'
exit $CODE



