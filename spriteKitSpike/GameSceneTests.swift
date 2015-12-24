import SpriteKit
import XCTest
@testable import spriteKitSpike

class GameSceneTests: XCTestCase {
    
    func testWhenMonsterReachesLeftSide_ThenWeTransition() {
        let testObject = GameScene(size: CGSize())
        
        let mockView = MockView()
        let mockVC = MockGameViewController()
        mockVC.gameScene = testObject
        mockVC.view = mockView
        mockVC.viewDidLoad()
        
        testObject.monsterHasReachedLeftSide()
        
        XCTAssertTrue(mockView.transitionCalled)
        
    }
    
}

private class MockView: GameView {
    
    private var transitionCalled = false
    
    private override func presentScene(scene: SKScene, transition: SKTransition) {
        transitionCalled = true
    }
    
}

private class MockGameViewController: GameViewController {
    
    private var gameScene: GameScene!
    
    private var gameView: GameView {
        return view as! GameView
    }
    
    private override func viewDidLoad() {
        gameView.presentScene(gameScene)
    }
    
}