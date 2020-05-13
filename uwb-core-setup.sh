#!/bin/bash -x

# Manually install the apps repo to avoid circular references
git clone https://github.com/decawave/uwb-apps repos/decawave-uwb-apps
cd repos/decawave-uwb-apps
# Try to checkout the same branch as core from apps if it exists
git checkout -q ${TRAVIS_BRANCH}
echo -n "Apps branch:"
git status -bs
cd -
# Apply Patches
cd repos/apache-mynewt-core
find ../decawave-uwb-core/patches/apache-mynewt-core/ -name "mynewt_1_7_0*"|while read name;do
    git apply $name;
done
cd -
