// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SocketRocket",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "SocketRocket",
            targets: ["SocketRocket"]
        )
    ],
    targets: [
        .target(
            name: "SocketRocket",
            path: "SocketRocket",
            sources: ["."],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include")
            ]
        )
    ]
)

