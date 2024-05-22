// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let swiftSettings: [SwiftSetting] = [
   .enableUpcomingFeature("BareSlashRegexLiterals"),
   .enableUpcomingFeature("ConciseMagicFile"),
   .enableUpcomingFeature("ExistentialAny"),
   .enableUpcomingFeature("ForwardTrailingClosures"),
   .enableUpcomingFeature("ImplicitOpenExistentials"),
   .enableUpcomingFeature("StrictConcurrency"),
   .enableUpcomingFeature("IsolatedDefaultValues"),
   .enableUpcomingFeature("GlobalConcurrency"),
   .enableUpcomingFeature("InferSendableFromCaptures"),
   .enableUpcomingFeature("RegionBasedIsolation"),
   .unsafeFlags(["-warn-concurrency",
                 "-enable-actor-data-race-checks"])
]

let package = Package(
    name: "Factory",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_14),
        .tvOS(.v13),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Factory",
            targets: ["Factory"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Factory",
            dependencies: [],
            resources: [.copy("PrivacyInfo.xcprivacy")],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "FactoryTests",
            dependencies: ["Factory"]),
    ]
)
