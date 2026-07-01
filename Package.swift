// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CloudflareNetworkDiagnosticTool",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // AppMaker Generator CLI
        .executable(
            name: "appmaker-generator",
            targets: ["AppMakerGenerator"]
        ),

        // Shared libraries (SwiftUI app uses these)
        .library(
            name: "DiagnosticEngine",
            targets: ["DiagnosticEngine"]
        ),
        .library(
            name: "DiagnosticModels",
            targets: ["DiagnosticModels"]
        ),
        .library(
            name: "DiagnosticServices",
            targets: ["DiagnosticServices"]
        ),
        .library(
            name: "ThemeManager",
            targets: ["ThemeManager"]
        )
    ],
    dependencies: [
        // ZIP compression for AppMaker
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.0"),

        // Logging (SwiftLog)
        .package(url: "https://github.com/apple/swift-log.git", from: "1.5.0")
    ],
    targets: [

        // ---------------------------------------------------------
        // MARK: - SwiftUI App Modules (Library Targets)
        // ---------------------------------------------------------

        .target(
            name: "DiagnosticModels",
            path: "SwiftUI-App/Models",
            swiftSettings: [.enableUpcomingFeature("StrictConcurrency")]
        ),

        .target(
            name: "DiagnosticEngine",
            dependencies: [
                "DiagnosticModels",
                .product(name: "Logging", package: "swift-log")
            ],
            path: "SwiftUI-App/Engine",
            swiftSettings: [.enableUpcomingFeature("StrictConcurrency")]
        ),

        .target(
            name: "DiagnosticServices",
            dependencies: [
                "DiagnosticModels",
                "DiagnosticEngine",
                .product(name: "Logging", package: "swift-log")
            ],
            path: "SwiftUI-App/Services",
            swiftSettings: [.enableUpcomingFeature("StrictConcurrency")]
        ),

        .target(
            name: "ThemeManager",
            path: "SwiftUI-App/Theme",
            swiftSettings: [.enableUpcomingFeature("StrictConcurrency")]
        ),

        // ---------------------------------------------------------
        // MARK: - AppMaker Generator (Executable Target)
        // ---------------------------------------------------------

        .executableTarget(
            name: "AppMakerGenerator",
            dependencies: [
                "DiagnosticModels",
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
                .product(name: "Logging", package: "swift-log")
            ],
            path: "AppMaker/Generator",
            resources: [
                .copy("../AppMaker/Templates")
            ],
            swiftSettings: [.enableUpcomingFeature("StrictConcurrency")]
        ),

        // ---------------------------------------------------------
        // MARK: - Tests
        // ---------------------------------------------------------

        .testTarget(
            name: "DiagnosticTests",
            dependencies: [
                "DiagnosticEngine",
                "DiagnosticModels",
                "DiagnosticServices"
            ],
            path: "SwiftUI-App/Tests"
        )
    ]
)
