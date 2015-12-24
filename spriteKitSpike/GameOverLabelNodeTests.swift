import SpriteKit
import XCTest
@testable import spriteKitSpike

class GameOverLabelNodeTests: XCTestCase {
    
    func testWhenGameOverLabelNodeIsInitialized_MyGameDoesntFreakingCrash() {
        let testObject = GameOverLabelNode(won: true, position: CGPoint())
        
        XCTAssertNotNil(testObject)
    }
    
}