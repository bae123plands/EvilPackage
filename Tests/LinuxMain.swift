import XCTest

import EvilPackageTests

var tests = [XCTestCaseEntry]()
tests += EvilPackageTests.allTests()
XCTMain(tests)
