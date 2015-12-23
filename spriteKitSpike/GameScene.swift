import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate, MonsterDelegate {
    
    private var player: SKSpriteNode!
    private var monstersDestroyed = 0
    
    override init(size: CGSize) {
        super.init(size: size)
        scaleMode = .ResizeFill
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("\(NSStringFromClass(self.dynamicType)) : \(__FUNCTION__) at \(__LINE__)")
    }
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        addPlayer()
        addMonsters()
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
    }
    
    // MARK: Action Handling
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.locationInNode(self)
        guard let offset = Projectile.projectileOffsetFor(touchLocation, projectilePosition: player.position) else {
            return
        }
        addProjectile(withOffset: offset)
        runAction(SKAction.playSoundFileNamed("pew-pew-lei.caf", waitForCompletion: false))
    }
    
    // SKPhysicsContactDelegate
    
    func didBeginContact(contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        if (firstBody.categoryBitMask != 0 && secondBody.categoryBitMask != 0) {
                projectileDidCollideWithMonster(firstBody.node as! SKSpriteNode, monster: secondBody.node as! SKSpriteNode)
        }
    }
    
    // Collision Handling
    
    func projectileDidCollideWithMonster(projectile:SKSpriteNode, monster:SKSpriteNode) {
        projectile.removeFromParent()
        monster.removeFromParent()
        monstersDestroyed++
        if (monstersDestroyed > 10) {
            let reveal = SKTransition.flipHorizontalWithDuration(0.5)
            let gameOverScene = GameOverScene(size: size, won: true)
            view?.presentScene(gameOverScene, transition: reveal)
        }
    }
    
    // MonsterDelegate
    
    func monsterHasReachedLeftSide() {
        let reveal = SKTransition.flipHorizontalWithDuration(0.5)
        let gameOverScene = GameOverScene(size: size, won: false)
        view?.presentScene(gameOverScene, transition: reveal)
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
        let actionSequence = [SKAction.runBlock(addMonster), SKAction.waitForDuration(1.0)]
        let action = SKAction.sequence(actionSequence)
        let repeatingAction = SKAction.repeatActionForever(action)
        runAction(repeatingAction)
    }
    
    private func addMonster() {
        let monster = Monster(withPosition: randomMonsterPosition)
        monster.delegate = self
        addChild(monster)
    }
    
    private var randomMonsterPosition: CGPoint {
        let minYPosition = Int(Monster.MonsterSize.height / 2)
        let maxYPosition = Int(size.height - Monster.MonsterSize.height / 2)
        let actualYPosition = RandomGenerator.random(minYPosition, max: maxYPosition)
        return CGPoint(x: size.width + Monster.MonsterSize.width / 2, y: actualYPosition)
    }
    
}
