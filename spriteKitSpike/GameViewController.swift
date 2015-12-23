import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    private var gameView: GameView {
        return self.view as! GameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.presentScene(GameScene(size: view.bounds.size))
    }

}
