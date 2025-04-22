#!/bin/bash

set -e

##############################
# Configuration
##############################

FRAMEWORK_NAME="Nativeblocks"
SCHEME_NAME="Nativeblocks"
PROJECT_NAME="${SCHEME_NAME}.xcodeproj"
OUTPUT_DIR="${PWD}/Build"
XCFRAMEWORK_OUTPUT="${OUTPUT_DIR}/${FRAMEWORK_NAME}.xcframework"

IOS_SIMULATOR_ARCHIVE="${OUTPUT_DIR}/${FRAMEWORK_NAME}-iphonesimulator.xcarchive"
IOS_DEVICE_ARCHIVE="${OUTPUT_DIR}/${FRAMEWORK_NAME}-iphoneos.xcarchive"
MACOS_ARCHIVE="${OUTPUT_DIR}/${FRAMEWORK_NAME}-macos.xcarchive"

IOS_SIMULATOR_FRAMEWORK="${IOS_SIMULATOR_ARCHIVE}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework"
IOS_DEVICE_FRAMEWORK="${IOS_DEVICE_ARCHIVE}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework"
MACOS_FRAMEWORK="${MACOS_ARCHIVE}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework"

##############################
# Clean previous builds
##############################

echo "🧹 Cleaning previous builds..."
rm -rf "${OUTPUT_DIR}"
mkdir -p "${OUTPUT_DIR}"

##############################
# Archive for iOS Simulator
##############################

echo "📦 Archiving for iOS Simulator..."
xcodebuild archive \
  -project "${PROJECT_NAME}" \
  -scheme "${SCHEME_NAME}" \
  -sdk iphonesimulator \
  -archivePath "${IOS_SIMULATOR_ARCHIVE}" \
  -destination 'generic/platform=iOS Simulator' \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO \
  ONLY_ACTIVE_ARCH=NO

##############################
# Archive for iOS Device
##############################

echo "📦 Archiving for iOS Device..."
xcodebuild archive \
  -project "${PROJECT_NAME}" \
  -scheme "${SCHEME_NAME}" \
  -sdk iphoneos \
  -archivePath "${IOS_DEVICE_ARCHIVE}" \
  -destination 'generic/platform=iOS' \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO \
  ONLY_ACTIVE_ARCH=NO

##############################
# Archive for macOS
##############################

echo "📦 Archiving for macOS..."
xcodebuild archive \
  -project "${PROJECT_NAME}" \
  -scheme "${SCHEME_NAME}" \
  -sdk macosx \
  -archivePath "${MACOS_ARCHIVE}" \
  -destination 'generic/platform=macOS' \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO \
  ONLY_ACTIVE_ARCH=NO

##############################
# Create XCFramework
##############################

echo "🛠 Creating XCFramework..."
xcodebuild -create-xcframework \
  -framework "${IOS_DEVICE_FRAMEWORK}" \
  -framework "${IOS_SIMULATOR_FRAMEWORK}" \
  -framework "${MACOS_FRAMEWORK}" \
  -output "${XCFRAMEWORK_OUTPUT}"

##############################
# Cleanup archives
##############################

echo "🧹 Cleaning up archives..."
rm -rf "${IOS_SIMULATOR_ARCHIVE}" "${IOS_DEVICE_ARCHIVE}" "${MACOS_ARCHIVE}"

echo "✅ XCFramework successfully created at: ${XCFRAMEWORK_OUTPUT}"
