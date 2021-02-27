import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OptionCalculatorTests.allTests),
    ]
}
#endif
