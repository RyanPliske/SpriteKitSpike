import Foundation
import XCTest
@testable import spriteKitSpike

class AudioPlayerTests: XCTestCase {
    
    func testWhenAudioFileIsPlayed_ItIsPlayedSuccessfully() {
        let testObject = AudioPlayer()
        
        let playedAudioFileSuccessfully = testObject.playAudioFile()
        
        XCTAssertTrue(playedAudioFileSuccessfully)
    }
    
}
