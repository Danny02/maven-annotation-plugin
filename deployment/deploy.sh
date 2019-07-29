#!/usr/bin/env bash
set -x
if [[ "$TRAVIS_TAG" == v?*.?*.?* ]] ; then
    mvn versions:set -DnewVersion=${TRAVIS_TAG:1}
    mvn source:jar javadoc:jar deploy -P release,ossrh --settings deployment/settings.xml
fi