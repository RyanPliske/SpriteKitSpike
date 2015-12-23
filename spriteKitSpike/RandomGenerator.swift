import UIKit

struct RandomGenerator {
    
    static func random(min: Int, max: Int) -> CGFloat {
        return CGFloat(arc4random_uniform(UInt32(max - min)) + UInt32(min))
    }
    
}