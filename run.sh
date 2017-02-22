#!/bin/bash

temporary_directory=$(mktemp -d)
cache_directory=${WERCKER_CACHE_DIR}/mitsuse/swiftlint
swiftlint=${cache_directory}/swiftlint-${WERCKER_SWIFTLINT_VERSION}
config_path=${WERCKER_GIT_REPOSITORY}/${WERCKER_SWIFTLINT_CONFIG}

if [ ! -f "${swiftlint}" ]; then
    git clone https://github.com/realm/SwiftLint.git \
        --branch ${WERCKER_SWIFTLINT_VERSION} \
        --depth 1 \
        ${temporary_directory}
    swift build -c release -C ${temporary_directory}
    mkdir -p $cache_directory
    cp ${temporary_directory}/.build/release/swiftlint ${swiftlint}
fi

$swiftlint lint --strict --config ${config_path} --path ${WERCKER_GIT_REPOSITORY}/Sources
$swiftlint lint --strict --config ${config_path} --path ${WERCKER_GIT_REPOSITORY}/Tests
