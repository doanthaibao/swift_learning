import UIKit

public protocol ColorPalette{
    var backgroundColor: UIColor {get}
    var textColor: UIColor {get}
}
public enum ColorTheme{
    case whiteboard
    case blackboard
    case milkCoffee
    case nightswimming
}
extension UIColor {
    convenience init(hex: UInt32){
        let divisor = Float(255)
        let red = CGFloat(Float((hex & 0xFF0000) >> 16) / divisor)
        let green = CGFloat(Float((hex & 0xFF0000) >> 8) / divisor)
        let blue = CGFloat(Float((hex & 0xFF0000) >> 16) / divisor)
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
struct WhiteboardPalette: ColorPalette{
    public var backgroundColor: UIColor {
        get{
            return UIColor.white
        }
    }
    public var textColor: UIColor {
        get {
            return UIColor.black
        }
    }
}
struct BlackboardPalette: ColorPalette {
    public var backgroundColor: UIColor {
        get{
            return UIColor.black
        }
    }
    public var textColor: UIColor {
        get {
            return UIColor.white
        }
    }
}
struct MilkCoffeePalette: ColorPalette{
    public var backgroundColor: UIColor{
        get {
            return UIColor.brown
        }
    }
    public var textColor: UIColor{
        get{
            return UIColor.white
        }
    }
}
struct NightSwimmingPalette: ColorPalette{
    public var backgroundColor: UIColor{
        get {
            return UIColor(hex: 0x191970)
        }
    }
    public var textColor: UIColor{
        get{
            return UIColor.white
        }
    }
}

public class PaletteFactory{
    public class func makePalette(theme: ColorTheme) ->ColorPalette{
        switch theme {
        case .blackboard:
            return BlackboardPalette()
        case .whiteboard:
            return WhiteboardPalette()
        case .milkCoffee:
            return MilkCoffeePalette()
        case .nightswimming:
            return NightSwimmingPalette()
        }
    }
}

var label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 600, height: 44)))
label.textAlignment = .center

let whiteboardPalette = PaletteFactory.makePalette(theme: .whiteboard)
label.backgroundColor = whiteboardPalette.backgroundColor
label.textColor = whiteboardPalette.textColor
label.text = "Whiteboard Palette"

let blackboardPalette = PaletteFactory.makePalette(theme: .blackboard)
label.backgroundColor = blackboardPalette.backgroundColor
label.textColor = blackboardPalette.textColor
label.text = "Blackboard Palette"

let milkCoffeePalette = PaletteFactory.makePalette(theme: .milkCoffee)
label.backgroundColor = milkCoffeePalette.backgroundColor
label.textColor = milkCoffeePalette.textColor
label.text = "MilkCoffee Palette"
