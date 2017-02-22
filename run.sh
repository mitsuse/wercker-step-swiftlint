#!/bin/bash

temporary_directory=$(mktemp -d)
swiftlint=${temporary_directory}/.build/release/swiftlint
config_path=${WERCKER_GIT_REPOSITORY}/${WERCKER_SWIFTLINT_CONFIG}

git clone https://github.com/realm/SwiftLint.git \
    --branch ${WERCKER_SWIFTLINT_VERSION} \
    --depth 1 \
    ${temporary_directory}

swift build -c release -C ${temporary_directory}

$swiftlint lint --strict --config ${config_path} --path ${WERCKER_GIT_REPOSITORY}/Sources
$swiftlint lint --strict --config ${config_path} --path ${WERCKER_GIT_REPOSITORY}/Tests
