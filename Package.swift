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
            url: "https://github.com/nativeblocks/nativeblocks-ios-sdk/releases/download/1.3.2/Nativeblocks.xcframework.zip",
            checksum: "c21c272e967e8065ca98aeec30a1e41ebe73a325d3e3af5cb6eb26ddf4021757"
        )
    ]
)
