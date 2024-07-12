#!/bin/bash

SCHEME_NAME="NativeblocksCore"
FRAMEWORK_NAME="NativeblocksCore"

rm -rf "${SIMULATOR_ARCHIVE_PATH}"
rm -rf "${DEVICE_ARCHIVE_PATH}"
rm -rf "${OUTPUT_DIR}${FRAMEWORK_NAME}.xcframework"

SIMULATOR_ARCHIVE_PATH="${PWD}/${FRAMEWORK_NAME}-iphonesimulator.xcarchive"
DEVICE_ARCHIVE_PATH="${PWD}/${FRAMEWORK_NAME}-iphoneos.xcarchive"

SIMULATOR_FRAMEWORK_PATH="${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework"
DEVICE_FRAMEWORK_PATH="${DEVICE_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework"

OUTPUT_DIR="${PWD}/"

# Create the output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

echo "Creating simulator xcarchive... ######"
xcodebuild archive \
  ONLY_ACTIVE_ARCH=NO \
  -scheme ${SCHEME_NAME} \
  -project "${SCHEME_NAME}.xcodeproj" \
  -archivePath ${SIMULATOR_ARCHIVE_PATH} \
  -sdk iphonesimulator \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

echo "Creating device xcarchive...######"
xcodebuild archive \
  -scheme ${SCHEME_NAME} \
  -project "${SCHEME_NAME}.xcodeproj" \
  -archivePath ${DEVICE_ARCHIVE_PATH} \
  -sdk iphoneos \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  SKIP_INSTALL=NO

echo "Creating xcframework...######"
xcodebuild -create-xcframework \
  -framework ${DEVICE_FRAMEWORK_PATH} \
  -framework ${SIMULATOR_FRAMEWORK_PATH} \
  -output ${OUTPUT_DIR}/${FRAMEWORK_NAME}.xcframework

rm -rf "${SIMULATOR_ARCHIVE_PATH}"
rm -rf "${DEVICE_ARCHIVE_PATH}"
