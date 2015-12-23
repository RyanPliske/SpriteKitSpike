import SpriteKit

class Monster: SKSpriteNode {
    
    static let MonsterSize = CGSize(width: 30, height: 40)
    
    init(withPosition position: CGPoint) {
        let texture = SKTexture(imageNamed: "monster")
        super.init(texture: texture, color: UIColor(), size: Monster.MonsterSize)
        self.position = position
        setUpMonster()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUpMonster() {
        let durationOfMove = RandomGenerator.random(2, max: 4)
        let positionToMoveTo = CGPoint(x: -self.size.width/2, y: self.position.y)
        let actionMove = SKAction.moveTo(positionToMoveTo, duration: NSTimeInterval(durationOfMove))
        let actionMoveDone = SKAction.removeFromParent()
        self.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
}