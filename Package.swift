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
            type: .static,
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
                .headerSearchPath("include"),
                .unsafeFlags(["-fembed-bitcode"], .when(platforms: [.iOS]))
            ],
            linkerSettings: [
                .linkedFramework("CFNetwork", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("Security"),
                .linkedFramework("CoreServices", .when(platforms: [.macOS])),
                .linkedLibrary("icucore")
            ]
        )
    ]
)

