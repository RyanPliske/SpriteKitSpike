import SpriteKit

class Projectile: SKSpriteNode {
    
    var offset: CGPoint! {
        didSet {
            setupProjectile()
        }
    }
    
    func setupProjectile() {
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