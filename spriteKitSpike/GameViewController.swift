import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    private let audioPlayer = AudioPlayer()
    
    private var gameView: GameView {
        return view as! GameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.presentScene(GameScene(size: view.bounds.size))
        audioPlayer.playAudioFile()
    }

}
