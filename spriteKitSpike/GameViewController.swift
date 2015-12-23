import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    private var skView: SKView {
        return self.view as! SKView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
    }

}
