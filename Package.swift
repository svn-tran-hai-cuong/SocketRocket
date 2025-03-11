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
                .unsafeFlags(["-fembed-bitcode"], .when(platforms: [.iOS])),
                .unsafeFlags(["-arch", "x86_64"], .when(platforms: [.iOS], configuration: .debug)),
                .define("DEFINES_MODULE", to: "YES"), // Tương đương với DEFINES_MODULE = YES
                .define("CLANG_MODULES_AUTOLINK", to: "NO"), // Disable clang modules autolink
                .define("DEAD_CODE_STRIPPING", to: "NO"), // Không bỏ mã không dùng
                .define("GCC_DYNAMIC_NO_PIC", to: "NO"),
                .define("ONLY_ACTIVE_ARCH", to: "YES"), // Chỉ build cho kiến trúc đang hoạt động
                .define("GCC_OPTIMIZATION_LEVEL", to: "0"), // Không tối ưu code C/C++
                .define("SWIFT_OPTIMIZATION_LEVEL", to: "-Onone"), // Không tối ưu code Swift
                .define("GCC_PREPROCESSOR_DEFINITIONS", to: "DEBUG=1"), // Định nghĩa macro DEBUG
                .define("ENABLE_NS_ASSERTIONS", to: "YES"), // Bật NSAssertions
                .define("ENABLE_TESTABILITY", to: "YES"), // Hỗ trợ testability
                .define("COPY_PHASE_STRIP", to: "NO")
            ],
            cxxSettings: [.unsafeFlags(["-fno-objc-arc"]),
                          .unsafeFlags(["-fsanitize-undefined-trap-on-error", "-fsanitize=undefined-trap"]) // CFLAGS
            ],
            linkerSettings: [
                .linkedFramework("CoreServices", .when(platforms: [.macOS])),
                .linkedLibrary("icucore"),
                .linkedLibrary("c++"),
                .linkedLibrary("z"),
                .linkedLibrary("iconv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("resolv"),
                .linkedLibrary("sasl2", .when(platforms: [.macOS])),
                .linkedFramework("Security"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("Foundation"),
                .linkedFramework("SystemConfiguration"),
                .unsafeFlags(["-Wl,-rpath,@executable_path/Frameworks", "-Wl,-rpath,@loader_path/Frameworks"]),
                .unsafeFlags(["-Wl,-rpath,@executable_path/Frameworks", "-Wl,-rpath,@loader_path/Frameworks"]), // Tương đương INSTALL_PATH = @rpath
                .unsafeFlags(["-fsanitize-undefined-trap-on-error", "-fsanitize=undefined-trap"]) // LDFLAGS
            ]
        )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx20
)

