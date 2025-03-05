// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SocketRocket",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10),
        .tvOS(.v9),
    ],
    products: [
        .library(
            name: "SocketRocket",
            type: .dynamic,
            targets: ["SocketRocket"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SocketRocket",
            path: "SocketRocket",
            sources: ["SocketRocket.h","SRSecurityPolicy.h","SRSecurityPolicy.m","SRWebSocket.h","SRWebSocket.m","NSURLRequest+SRWebSocket.h","NSURLRequest+SRWebSocket.m","NSRunLoop+SRWebSocket.h","NSRunLoop+SRWebSocket.m","SRError.h","SRError.m","SRHash.h","SRHash.m","SRHTTPConnectMessage.h","SRHTTPConnectMessage.m","SRLog.h","SRLog.m","SRMutex.h","SRMutex.m","SRPinningSecurityPolicy.h","SRPinningSecurityPolicy.m","SRRandom.h","SRRandom.m","SRSIMDHelpers.h","SRSIMDHelpers.m","SRURLUtilities.h","SRURLUtilities.m","NSURLRequest+SRWebSocketPrivate.h","SRRunLoopThread.h","SRRunLoopThread.m","SRConstants.h","SRProxyConnect.h","SRProxyConnect.m","SRConstants.m","SRProxyConnect.h","SRProxyConnect.m","SRConstants.m","SRDelegateController.h","SRDelegateController.m","SRIOConsumer.h","SRIOConsumer.m","SRIOConsumerPool.h","SRIOConsumerPool.m"],
            cSettings: [
                .headerSearchPath("Internal/**"),
            ]),
    ]
)
