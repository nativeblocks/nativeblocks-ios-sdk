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
            url: "https://github.com/nativeblocks/nativeblocks-ios-sdk/releases/download/1.4.1/Nativeblocks.xcframework.zip",
            checksum: "f693e1ef6273e1ad902d6c41ca80d5127c1b6899c6ca12ab287cd8ba3eb6731a"
        )
    ]
)
