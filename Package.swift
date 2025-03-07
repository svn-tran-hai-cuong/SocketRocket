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
            sources: [ // Đảm bảo tất cả file .m được biên dịch
                "NSRunLoop+SRWebSocket.m",
                "NSURLRequest+SRWebSocket.m",
                "SRConstants.m",
                "SRDelegateController.m",
                "SRError.m",
                "SRHash.m",
                "SRHTTPConnectMessage.m",
                "SRIOConsumer.m",
                "SRIOConsumerPool.m",
                "SRLog.m",
                "SRMutex.m",
                "SRPinningSecurityPolicy.m",
                "SRProxyConnect.m",
                "SRRandom.m",
                "SRRunLoopThread.m",
                "SRSecurityPolicy.m",
                "SRSIMDHelpers.m",
                "SRURLUtilities.m",
                "SRWebSocket.m"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .define("SR_LOG_ENABLED", to: "1")
            ]
        )
    ]
)
