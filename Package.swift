// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "ContentsquareModule",
            targets: ["ContentsquareModuleWrapper"]),
    ],
    dependencies: [
        .package(
            name: "SwiftProtobuf",
            url: "https://github.com/apple/swift-protobuf.git",
            "1.15.0" ..< "2.0.0"),
    ],
    targets: [
        // binaryTarget doesn't support dependency, use a wrapper to fix this.
        .target(
            name: "ContentsquareModuleWrapper",
            dependencies: [
                .target(name: "ContentsquareModule"),
                "SwiftProtobuf"
            ],
            path: "ContentsquareModuleWrapper",
            resources: [
                .process("ContentsquareBundle.bundle")
            ]),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK_MOCK/releases/download/4.12.0/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "b34ce5c5d931c7a55db1169daf876354c12c381c7b463451c6fc4395e06066ab"),
    ]
)