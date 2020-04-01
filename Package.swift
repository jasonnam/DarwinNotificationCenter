// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "DarwinNotificationCenter",
    products: [
        .library(
            name: "DarwinNotificationCenter",
            targets: ["DarwinNotificationCenter"])
    ],
    targets: [
        .target(
            name: "DarwinNotificationCenter"),
        .testTarget(
            name: "DarwinNotificationCenterTests",
            dependencies: ["DarwinNotificationCenter"])
    ]
)
