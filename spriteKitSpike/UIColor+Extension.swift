import UIKit

extension UIColor {
    
    func convertColorToRGBSpaceColor() -> UIColor {
        let colorSpaceRGB = CGColorSpaceCreateDeviceRGB()
        let oldComponents = CGColorGetComponents(self.CGColor)
        let components = [oldComponents[0], oldComponents[0], oldComponents[0], oldComponents[1]]
        let colorRef = CGColorCreate(colorSpaceRGB, components)
        let convertedColor = UIColor(CGColor: colorRef!)
        return convertedColor
    }
    
}