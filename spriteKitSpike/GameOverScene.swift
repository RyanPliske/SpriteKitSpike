import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    init(size: CGSize, won: Bool) {
        super.init(size: size)
        backgroundColor = UIColor.whiteColor()
        let message = won ? "You Won!" : "You Lose!"
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(label)
        
        let actionSequence = [SKAction.waitForDuration(6.0), SKAction.runBlock(flip)]
        let action: SKAction = SKAction.sequence(actionSequence)
        runAction(action)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func flip() {
        let reveal = SKTransition.flipHorizontalWithDuration(0.5)
        let scene = GameScene(size: self.size)
        self.view?.presentScene(scene, transition: reveal)
    }
    
}