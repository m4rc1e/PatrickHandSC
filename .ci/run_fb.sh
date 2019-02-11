#!/bin/sh
# Run only the most crucial Fontbakery checks. Check fonts render on 

file_names=`curl -v -H "Authorization: token $GH_TOKEN" "https://api.github.com/repos/$TRAVIS_REPO_SLUG/pulls/$TRAVIS_PULL_REQUEST/files" | jq '.[] | .filename' | tr '\n' ' ' | tr '"' ' '`
fontbakery check-googlefonts \
    -c com.google.fonts/check/016 \
    -c com.google.fonts/check/020 \
    -c com.google.fonts/check/036 \
    -c com.google.fonts/check/040 \
    -c com.google.fonts/check/045 \
    -c com.google.fonts/check/067 \
    -c com.google.fonts/check/129 \
    -c com.google.fonts/check/130 \
    -c com.google.fonts/check/131 \
    -c com.google.fonts/check/165 \
    -c com.google.fonts/check/vttclean \
    -c com.google.fonts/check/ttx-roundtrip \
    $file_names -l FAIL -n
