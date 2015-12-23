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
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.locationInNode(self)
        let projectile = SKSpriteNode(imageNamed: "projectile")
        projectile.position = player.position
        
        guard let offset = projectileOffsetFor(touchLocation, projectilePosition: projectile.position) else {
            return
        }
        
        addChild(projectile)
        
        let direction = offset.normalized()
        let shootAmount = direction * 1000
        let destination = shootAmount + projectile.position
        
        let actionMove = SKAction.moveTo(destination, duration: 2.0)
        let actionMoveDone = SKAction.removeFromParent()
        projectile.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    private func projectileOffsetFor(touchLocation: CGPoint, projectilePosition: CGPoint) -> CGPoint? {
        let offset = touchLocation - projectilePosition
        return offset.x > -10 ? offset : nil
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
