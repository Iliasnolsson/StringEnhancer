import XCTest
@testable import StringEnhancer

final class StringEnhancerTests: XCTestCase {
    
    // Test for subscript functionality
    func testSubscript() {
        let sample = "Hello, World!"
        XCTAssertEqual(sample[0], "H")
        XCTAssertEqual(sample[1..<5], "ello")
        XCTAssertEqual(sample[7..<13], "World!")
    }

    // Test for numeric formatting with separators
    func testFormattedWithSeparator() {
        let number: Int = 123456789
        XCTAssertEqual(number.formattedWithSeparator, "123 456 789")
    }

    // Test for finding indices of characters
    func testIndicesForCharacters() {
        let text = "Hello, World!"
        let indices = text.indicies(forCharactersWhere: {$0 == "l"})
        XCTAssertEqual(indices, [text.index(text.startIndex, offsetBy: 2), text.index(text.startIndex, offsetBy: 3), text.index(text.startIndex, offsetBy: 10)])
    }

    // Test for replacing all occurrences of a character
    func testReplaceAllOccurrences() {
        var text = "Hello, World!"
        text.replaceAll(ofCharacter: "l", with: "L")
        XCTAssertEqual(text, "HeLLo, WorLd!")
    }

    // Test for capitalizing the first letter
    func testCapitalizeFirstLetter() {
        var text = "hello, world!"
        text.capitalizeFirstLetter()
        XCTAssertEqual(text, "Hello, world!")
    }

    // Test for creating unique strings
    func testUniqueString() {
        let existingStrings = ["abc", "def", "ghi"]
        let uniqueString = String(uniqueIn: existingStrings)
        XCTAssertFalse(existingStrings.contains(uniqueString))
    }
    
    
    
}
