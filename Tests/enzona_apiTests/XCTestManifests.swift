import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(enzona_apiTests.allTests),
    ]
}
#endif
