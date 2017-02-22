#!/bin/bash

temporary_directory=$(mktemp -d)
cache_directory=${WERCKER_CACHE_DIR}/mitsuse/swiftlint/${WERCKER_SWIFTLINT_VERSION}
swiftlint=${cache_directory}/release/swiftlint
config_path=${WERCKER_SOURCE_DIR}/${WERCKER_SWIFTLINT_CONFIG}

if [ ! -f "${swiftlint}" ]; then
    git clone https://github.com/realm/SwiftLint.git \
        --branch ${WERCKER_SWIFTLINT_VERSION} \
        --depth 1 \
        ${temporary_directory}
    swift build -c release --chdir ${temporary_directory} --build-path ${cache_directory}
fi

$swiftlint lint --strict --config ${config_path} --path ${WERCKER_SOURCE_DIR}/Sources
$swiftlint lint --strict --config ${config_path} --path ${WERCKER_SOURCE_DIR}/Tests
