import SpriteKit

class Monster: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "monster")
        let size = CGSize(width: 30, height: 40)
        super.init(texture: texture, color: UIColor(), size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpMonster() {
        let durationOfMove = RandomGenerator.random(2, max: 4)
        let positionToMoveTo = CGPoint(x: -self.size.width/2, y: self.position.y)
        let actionMove = SKAction.moveTo(positionToMoveTo, duration: NSTimeInterval(durationOfMove))
        let actionMoveDone = SKAction.removeFromParent()
        self.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
}