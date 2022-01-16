// swift-tools-version:5.3.0

import PackageDescription

let name: String = "CoreUtils"

let package = Package(
    name: name,
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(name: name, targets: [name])
    ],
    targets: [
        .target(name: name, path: "Sources")
    ]
)
