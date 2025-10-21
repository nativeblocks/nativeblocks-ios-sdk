// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nativeblocks",
    platforms: [.iOS(.v15), .macOS(.v13)],
    products: [.library(name: "Nativeblocks", targets: ["Nativeblocks"])],
    targets: [
        .binaryTarget(
            name: "Nativeblocks",
            url: "https://github.com/nativeblocks/nativeblocks-ios-sdk/releases/download/1.6.1/Nativeblocks.xcframework.zip",
            checksum: "6a84d670a1f5db929e7da6d21f0e5cf23790de0de7552f93dcd3fe1900c2ab3c"
        )
    ]
)
