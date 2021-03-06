import SpriteKit

protocol MonsterDelegate: class {
    func monsterHasReachedLeftSide()
}

class Monster: SKSpriteNode {
    
    static let MonsterSize = CGSize(width: 30, height: 40)
    
    weak var delegate: MonsterDelegate?
    
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
        let positionToMoveTo = CGPoint(x: -size.width/2, y: position.y)
        let actionMove = SKAction.moveTo(positionToMoveTo, duration: NSTimeInterval(durationOfMove))
        let actionMoveDone = SKAction.removeFromParent()
        let loseAction = SKAction.runBlock { [unowned self]() -> Void in
            self.delegate?.monsterHasReachedLeftSide()
        }
        runAction(SKAction.sequence([actionMove, loseAction, actionMoveDone]))
        
        // Setup the HitBox
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        // Physics Engine will not control the monster, I will.
        physicsBody?.dynamic = true
        // Assign collisions
        physicsBody?.categoryBitMask = PhysicsCategory.Monster
        physicsBody?.contactTestBitMask = PhysicsCategory.Projectile
        physicsBody?.collisionBitMask = PhysicsCategory.None
    }
    

    
}