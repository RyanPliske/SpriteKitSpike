import SpriteKit

class GameView: SKView {
    
    init() {
        super.init(frame: CGRectZero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        showsFPS = true
        showsNodeCount = true
        ignoresSiblingOrder = true
    }
    
}