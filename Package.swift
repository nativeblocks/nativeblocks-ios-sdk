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
            url: "https://github.com/nativeblocks/nativeblocks-ios-sdk/releases/download/1.8.1/Nativeblocks.xcframework.zip",
            checksum: "d3ef11458f00cd56d3500e29f6a4e3bff4e8a2b9b366cabd36493b8a2ec9177b"
        )
    ]
)
