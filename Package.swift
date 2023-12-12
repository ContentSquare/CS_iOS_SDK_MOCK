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
            name: "SwiftProtobuf",
            url: "https://github.com/apple/swift-protobuf.git",
            "1.15.0" ..< "2.0.0"),
        .package(
            name: "CSCrashReporter",
            url: "https://github.com/ContentSquare/CS_iOS_CrashReporter.git",
            .exact("0.0.3")),
    ],
    targets: [
        // binaryTarget doesn't support dependency, use a wrapper to fix this.
        .target(
            name: "ContentsquareModuleWrapper",
            dependencies: [
                .target(name: "ContentsquareModule"),
                "SwiftProtobuf",
                "CSCrashReporter"
            ],
            path: "ContentsquareModuleWrapper",
            resources: [
                .process("ContentsquareBundle.bundle")
            ]
        ),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK_MOCK/releases/download/4.27.1/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "acc571cf25d969bb08ba92ecac3290632da9de74dcb0ed7f29e6608c38d677bc"),
    ]
)