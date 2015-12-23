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
        let destination = shootAmount + self.position
        
        let actionMove = SKAction.moveTo(destination, duration: 2.0)
        let actionMoveDone = SKAction.removeFromParent()
        self.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    class func projectileOffsetFor(touchLocation: CGPoint, projectilePosition: CGPoint) -> CGPoint? {
        let offset = touchLocation - projectilePosition
        return offset.x > -10 ? offset : nil
    }
    
}