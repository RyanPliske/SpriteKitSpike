import SpriteKit

class GameScene: SKScene {
    
    private var player: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        addPlayer()
        
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addMonster),
                SKAction.waitForDuration(1.0)
                ])
            ))
    }
    
    private func addPlayer() {
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(player)
    }
    
    private func addMonster() {
        let monster = SKSpriteNode(imageNamed: "monster")
        let min = Int(monster.size.height / 2)
        let max = Int(size.height - monster.size.height / 2)
        let yPosition = RandomGenerator.random(min, max: max)
        monster.position = CGPoint(x: size.width + monster.size.width / 2, y: yPosition)
        addChild(monster)
        
        let durationOfMove = RandomGenerator.random(2, max: 4)
        let positionToMoveTo = CGPoint(x: -monster.size.width/2, y: yPosition)
        let actionMove = SKAction.moveTo(positionToMoveTo, duration: NSTimeInterval(durationOfMove))
        let actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
}
