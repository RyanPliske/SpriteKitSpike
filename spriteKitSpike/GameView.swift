import SpriteKit

class GameView: SKView {
    
    init() {
        super.init(frame: CGRectZero)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        showsFPS = true
        showsNodeCount = true
        ignoresSiblingOrder = true
    }
    
}