import XCTest
@testable import CrislerKit

final class CrislerKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CrislerKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
