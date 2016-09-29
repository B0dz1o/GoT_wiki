#!/bin/bash

echo 'travis_fold:start:xcodebuild'

xcodebuild test \
 -workspace GoT_wiki.xcworkspace \
 -scheme allTests \
 -destination 'platform=iOS Simulator,name=iPhone 5S,OS=9.3' 

echo 'travis_fold:end:xcodebuild'

