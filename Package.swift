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
                .define("COPY_PHASE_STRIP", to: "NO"),
                .define("ALWAYS_SEARCH_USER_PATHS", to: "NO"), // Không dùng tìm kiếm thư mục cũ
                .define("ARCHS", to: "$(ARCHS_STANDARD)"), // Dùng kiến trúc tiêu chuẩn
                .define("CLANG_ENABLE_MODULES", to: "YES"), // Cho phép import module
                .define("CLANG_ENABLE_MODULE_DEBUGGING", to: "NO"), // Không debug module
                .define("CLANG_ENABLE_OBJC_ARC", to: "YES"), // ARC cho Obj-C
                .define("GCC_VERSION", to: "com.apple.compilers.llvm.clang.1_0"), // Dùng Clang
                .define("DEAD_CODE_STRIPPING", to: "NO"), // Không xóa code không dùng
                .define("DEBUG_INFORMATION_FORMAT", to: "dwarf-with-dsym"), // Định dạng debug symbol
                .define("GCC_C_LANGUAGE_STANDARD", to: "gnu11"), // C chuẩn gnu11
                .define("GCC_DYNAMIC_NO_PIC", to: "NO"), // Không dùng Position-Independent Code
                .define("GCC_INLINES_ARE_PRIVATE_EXTERN", to: "YES"), // Inline functions là private
                .define("GCC_NO_COMMON_BLOCKS", to: "YES"), // Không dùng common blocks
                .define("GCC_SYMBOLS_PRIVATE_EXTERN", to: "NO") // Giữ symbol ở mức global
            ],
            cxxSettings: [.unsafeFlags(["-fno-objc-arc"]),
                          .unsafeFlags(["-fsanitize-undefined-trap-on-error", "-fsanitize=undefined-trap"]), // CFLAGS
                          .define("CLANG_CXX_LANGUAGE_STANDARD", to: "gnu++17"), // Chuẩn C++17
                          .define("CLANG_CXX_LIBRARY", to: "libc++") // Dùng libc++
            ],
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-enable-testing"]), // Bật testability
                .unsafeFlags(["-Xclang", "-analyze"]) // Bật static analyzer
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

