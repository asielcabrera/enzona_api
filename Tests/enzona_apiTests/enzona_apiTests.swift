import XCTest
@testable import enzona_api

final class enzona_apiTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(enzona_api().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
