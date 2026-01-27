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
            url: "https://github.com/nativeblocks/nativeblocks-ios-sdk/releases/download/1.8.0/Nativeblocks.xcframework.zip",
            checksum: "965e37d9ae5eaaa9c043947fa37424f163fbe50f44e79ceb9cce165f2ae5ff82"
        )
    ]
)
