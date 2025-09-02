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
            url: "https://github.com/nativeblocks/nativeblocks-ios-sdk/releases/download/1.5.0/Nativeblocks.xcframework.zip",
            checksum: "23b5aac29269dafa77198a599821ba4f976b2ec4e815c5c567136abdb4b59931"
        )
    ]
)
