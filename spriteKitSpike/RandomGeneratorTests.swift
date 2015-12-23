import Foundation
import XCTest
@testable import spriteKitSpike

class RandomGeneratorTests: XCTestCase {
    
    func testWhenCreatingRandomNumber_ThatNumberIsMoreThanMinAndLessThanMax() {
        for index in 0...100 {
            createRandomNumber(index, expectedMax: 100)
        }
    }
    
    private func createRandomNumber(expectedMin: Int, expectedMax: Int) {
        
        let randomNumber = RandomGenerator.random(expectedMin, max: expectedMax)
        
        XCTAssertLessThanOrEqual(CGFloat(expectedMin), randomNumber)
        XCTAssertGreaterThanOrEqual(CGFloat(expectedMax), randomNumber)
    }
    
}
