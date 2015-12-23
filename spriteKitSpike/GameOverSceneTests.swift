import Foundation
import XCTest
import SpriteKit
@testable import spriteKitSpike

class GameOverSceneTests: XCTestCase {
    
    func testWhenGameOverSceneIsInitialized_ThatBackgroundIsWhite() {
        let testObject = GameOverScene(size: CGSize(), won: true)
        let returnedColor = testObject.backgroundColor
        let expectedColor = UIColor.whiteColor().convertColorToRGBSpaceColor()
        
        XCTAssertTrue(returnedColor.isEqual(expectedColor))
    }
    
}