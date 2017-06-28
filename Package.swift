// swift-tools-version:3.1

import PackageDescription

let package = Package(
  name: "paya",
  targets: [
    Target(name: "paya-core"),
    Target(name: "paya-cli", dependencies: ["paya-core"]),
  ],
  dependencies: [
    /// web server
    .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7),
    /// markdown render
    .Package(url: "https://github.com/stephenwzl/swift-markdown.git", majorVersion: 1, minor: 2),
    /// html template render
    .Package(url: "https://github.com/kylef/Stencil.git", majorVersion: 0, minor: 8),
    /// yaml config file parser
    .Package(url: "https://github.com/jpsim/Yams.git", majorVersion: 0)
  ]
)
