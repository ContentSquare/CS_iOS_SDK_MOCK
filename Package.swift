// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "ContentsquareModule",
            targets: ["ContentsquareModuleWrapper"]),
    ],
    dependencies: [
        .package(
            name: "CSSwiftProtobuf",
            url: "https://github.com/ContentSquare/CSSwiftProtobuf.git",
            .exact("1.28.2")),
        .package(
            name: "CSCrashReporter",
            url: "https://github.com/ContentSquare/CS_iOS_CrashReporter.git",
            .exact("1.0.1")),
    ],
    targets: [
        // binaryTarget doesn't support dependency, use a wrapper to fix this.
        .target(
            name: "ContentsquareModuleWrapper",
            dependencies: [
                .target(name: "ContentsquareModule"),
                "CSSwiftProtobuf",
                "CSCrashReporter"
            ],
            path: "ContentsquareModuleWrapper",
            resources: [
                .process("ContentsquareBundle.bundle"),
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK_MOCK/releases/download/4.41.3/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "b421a82e3feb8697a7bd80fd0c2a6bdfb5b4ff119c6d8d7ede46928e09b150c1"),
    ]
)