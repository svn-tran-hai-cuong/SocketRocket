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
            targets: ["SocketRocket"]
        ),
    ],
    targets: [
        .target(
            name: "SocketRocket",
            path: "SocketRocket",
            exclude: ["Info.plist"], // Loại bỏ file không cần thiết
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("."),
                .define("SR_LOG_ENABLED", to: "1")
            ]
        )
    ]
)
