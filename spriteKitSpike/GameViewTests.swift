import Foundation
import XCTest
@testable import spriteKitSpike

class GameViewTests: XCTestCase {
    
    func testWhenGameViewIsInitalized_ThatMyConditionsAreSet() {
        var testObject = GameView()
        
        XCTAssertTrue(testObject.showsFPS)
        XCTAssertTrue(testObject.showsNodeCount)
        XCTAssertTrue(testObject.ignoresSiblingOrder)
        
        testObject = GameView(coder: NSCoder.empty())!
        
        XCTAssertTrue(testObject.showsFPS)
        XCTAssertTrue(testObject.showsNodeCount)
        XCTAssertTrue(testObject.ignoresSiblingOrder)
    }
    
}