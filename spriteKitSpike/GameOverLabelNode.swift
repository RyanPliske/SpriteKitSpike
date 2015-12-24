import SpriteKit

class GameOverLabelNode: SKLabelNode {
    
    enum Message: String {
        case Win = "You Won!"
        case Loss = "You Lose!"
    }
    
    convenience init(won: Bool, position: CGPoint) {
        self.init(fontNamed: "Chalkduster")
        let text = won ? Message.Win.rawValue : Message.Loss.rawValue
        self.text = text
        self.position = position
        self.fontSize = 40
        self.fontColor = SKColor.blackColor()
        
    }
    
}