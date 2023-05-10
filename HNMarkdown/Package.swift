// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HNMarkdown",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "HNMarkdown",
            targets: ["HNMarkdown"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-markdown.git", branch: "main"),
        .package(url: "https://github.com/malcommac/SwiftRichString.git", from: "3.0.0"),
        .package(url: "https://github.com/JohnSundell/Splash", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "HNMarkdown",
            dependencies: [
                "Splash",
                "SwiftRichString",
                .product(name: "Markdown", package: "swift-markdown"),
            ],
            path:"Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)