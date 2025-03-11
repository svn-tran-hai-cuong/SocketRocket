// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SocketRocket",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SocketRocket",
            type: .static,
            targets: ["SocketRocket"]
        ),
    ],
    targets: [
        .target(
            name: "SocketRocket",
            path: "SocketRocket",
            cSettings: [
                .headerSearchPath("include")
            ]
        )
    ]
)
