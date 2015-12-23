import SpriteKit

class GameScene: SKScene {
    
    private var player: SKSpriteNode!
    
    override init(size: CGSize) {
        super.init(size: size)
        self.scaleMode = .ResizeFill
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Action Handling
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        addPlayer()
        addMonsters()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.locationInNode(self)
        guard let offset = Projectile.projectileOffsetFor(touchLocation, projectilePosition: player.position) else {
            return
        }
        addProjectile(withOffset: offset)
    }
    
    // MARK: Add Nodes
    
    private func addProjectile(withOffset offset: CGPoint) {
        let projectile = Projectile(offset: offset, position: player.position)
        addChild(projectile)
    }
    
    private func addPlayer() {
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(player)
    }
    
    private func addMonsters() {
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addMonster),
                SKAction.waitForDuration(1.0)
                ])
            ))
    }
    
    private func addMonster() {
        let monster = Monster(withPosition: randomMonsterPosition)
        addChild(monster)
    }
    
    private var randomMonsterPosition: CGPoint {
        let minYPosition = Int(Monster.MonsterSize.height / 2)
        let maxYPosition = Int(size.height - Monster.MonsterSize.height / 2)
        let actualYPosition = RandomGenerator.random(minYPosition, max: maxYPosition)
        return CGPoint(x: size.width + Monster.MonsterSize.width / 2, y: actualYPosition)
    }
    
}
