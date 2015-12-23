import SpriteKit

class Monster: SKSpriteNode {
    
    func setUpMonster() {
        let durationOfMove = RandomGenerator.random(2, max: 4)
        let positionToMoveTo = CGPoint(x: -self.size.width/2, y: self.position.y)
        let actionMove = SKAction.moveTo(positionToMoveTo, duration: NSTimeInterval(durationOfMove))
        let actionMoveDone = SKAction.removeFromParent()
        self.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
}