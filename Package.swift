// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeasureAccelelates",
    products: [
        .library(
            name: "MeasureAccelelates",
            targets: ["MeasureAccelelates"]
        ),
    ],
    targets: [
        .target(
            name: "MeasureAccelelates"
        ),
        .testTarget(
            name: "MeasureAccelelatesTests",
            dependencies: ["MeasureAccelelates"]
        ),
    ]
)
