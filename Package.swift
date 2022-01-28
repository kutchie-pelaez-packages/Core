// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(name: "Core", targets: ["Core"])
    ],
    targets: [
        .target(
            name: "Core",
            path: "Sources"
        )
    ]
)
