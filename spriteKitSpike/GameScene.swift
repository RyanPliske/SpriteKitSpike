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
        let monster = Monster(imageNamed: "monster")
        let minYPosition = Int(monster.size.height / 2)
        let maxYPosition = Int(size.height - monster.size.height / 2)
        let actualYPosition = RandomGenerator.random(minYPosition, max: maxYPosition)
        monster.position = CGPoint(x: size.width + monster.size.width / 2, y: actualYPosition)
        monster.setUpMonster()
        addChild(monster)
    }
    
}
