import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    private var gameView: GameView {
        return self.view as! GameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        gameView.presentScene(scene)
    }

}
