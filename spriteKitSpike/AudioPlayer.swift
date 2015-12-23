import Foundation
import AVFoundation

class AudioPlayer {
    
    private var audioPlayer: AVAudioPlayer!
    
    func playAudioFile() -> Bool {
        let audioFilePath = NSBundle.mainBundle().pathForResource("background-music-aac", ofType: "caf")!
        let audioFileUrl = NSURL.fileURLWithPath(audioFilePath)
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: audioFileUrl)
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            return true
        } catch {
            return false
        }
    }
    
}