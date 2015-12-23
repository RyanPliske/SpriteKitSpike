import SpriteKit

class Projectile: SKSpriteNode {
    
    let offset: CGPoint
    
    init(offset: CGPoint, position: CGPoint) {
        self.offset = offset
        let texture = SKTexture(imageNamed: "projectile")
        let size = CGSize(width: 15, height: 15)
        super.init(texture: texture, color: UIColor(), size: size)
        self.position = position
        setupProjectile()
    }

    required init?(coder aDecoder: NSCoder) {
        self.offset = CGPoint()
        super.init(coder: aDecoder)
    }
    
    private func setupProjectile() {
        let direction = offset.normalized()
        let shootAmount = direction * 1000
        let destination = shootAmount + position
        
        let actionMove = SKAction.moveTo(destination, duration: 2.0)
        let actionMoveDone = SKAction.removeFromParent()
        runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
        // Setup the HitBox
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        // Physics Engine will not control the projectile, I will.
        physicsBody?.dynamic = true
        // Assign collisions
        physicsBody?.categoryBitMask = PhysicsCategory.Projectile
        physicsBody?.contactTestBitMask = PhysicsCategory.Monster
        physicsBody?.collisionBitMask = PhysicsCategory.None
        physicsBody?.usesPreciseCollisionDetection = true
    }
    
    class func projectileOffsetFor(touchLocation: CGPoint, projectilePosition: CGPoint) -> CGPoint? {
        let offset = touchLocation - projectilePosition
        return offset.x > -10 ? offset : nil
    }
    
}