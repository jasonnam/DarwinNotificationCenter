// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Megaphone",
    products: [
        .library(
            name: "Megaphone",
            targets: ["Megaphone"])
    ],
    targets: [
        .target(
            name: "Megaphone"),
        .testTarget(
            name: "MegaphoneTests",
            dependencies: ["Megaphone"])
    ]
)
