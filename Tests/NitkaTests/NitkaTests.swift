@testable import Nitka
import XCTest

final class NitkaTests: XCTestCase {
    func testExample() throws {
        let n = Nitka()
        n.newChat(startMessage: "hello")
        XCTAssertEqual("", "")
    }
}
