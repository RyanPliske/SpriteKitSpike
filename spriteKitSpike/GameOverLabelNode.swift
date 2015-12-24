import SpriteKit

class GameOverLabelNode: SKLabelNode {
    
    enum Message: String {
        case Win = "You Won!"
        case Loss = "You Lose!"
    }
    
    override init() {
        super.init()
    }
    
    init(won: Bool, position: CGPoint) {
        super.init(fontNamed: "Chalkduster")
        let text = won ? Message.Win.rawValue : Message.Loss.rawValue
        self.text = text
        self.position = position
        self.fontSize = 40
        self.fontColor = SKColor.blackColor()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}