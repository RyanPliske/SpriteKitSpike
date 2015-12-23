import UIKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController {
    
    private var audioPlayer: AVAudioPlayer!
    
    private var gameView: GameView {
        return self.view as! GameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.presentScene(GameScene(size: view.bounds.size))
        playAudioFile()
    }
    
    private func playAudioFile() {
        let audioFilePath = NSBundle.mainBundle().pathForResource("background-music-aac", ofType: "caf")!
        let audioFileUrl = NSURL.fileURLWithPath(audioFilePath)
        try! audioPlayer = AVAudioPlayer(contentsOfURL: audioFileUrl)
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
    }

}
