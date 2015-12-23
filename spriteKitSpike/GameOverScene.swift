import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    enum Message: String {
        case Win = "You Won!"
        case Loss = "You Lose!"
    }
    
    init(size: CGSize, won: Bool) {
        super.init(size: size)
        backgroundColor = SKColor.whiteColor()
        displayLabel(won)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = SKColor.whiteColor()
    }
    
    deinit {
        print("\(NSStringFromClass(self.dynamicType)) : \(__FUNCTION__) at \(__LINE__)")
    }
    
    override func didMoveToView(view: SKView) {
        transitionBackToGameScene()
    }
    
    func displayLabel(won: Bool) {
        let label = SKLabelNode(fontNamed: "Chalkduster")
        let message = won ? Message.Win.rawValue : Message.Loss.rawValue
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(label)
    }
    
    func transitionBackToGameScene() {
        let actionSequence = [SKAction.waitForDuration(6.0), SKAction.runBlock(flip)]
        let action = SKAction.sequence(actionSequence)
        runAction(action)
    }
    
    private func flip() {
        let reveal = SKTransition.flipHorizontalWithDuration(0.5)
        let scene = GameScene(size: size)
        view?.presentScene(scene, transition: reveal)
    }
    
}