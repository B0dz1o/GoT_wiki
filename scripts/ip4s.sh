#!/bin/bash

xcodebuild test \
 -workspace GoT_wiki.xcworkspace \
 -scheme allTests \
 -destination 'platform=iOS Simulator,name=iPhone 4S,OS=9.3'


