import UIKit
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

public class ColorPalette{
    private var backgroundColorInternal: UIColor
    private var textColorInternal: UIColor
    final public var backgroundColor: UIColor{
        get{
            return backgroundColorInternal
        }
    }
    final public var textColor: UIColor{
        get {
            return textColorInternal
        }
    }
    public init(backgroundColor: UIColor, textColor: UIColor){
        self.backgroundColorInternal = backgroundColor
        self.textColorInternal = textColor
    }
    public class func make(theme: ColorTheme) ->ColorPalette{
        var result: ColorPalette
        switch theme {
        case .blackboard:
            result = BlackboardPalette()
        case .whiteboard:
            result = WhiteboardPalette()
        case .milkCoffee:
            result = MilkCoffeePalette()
        case .nightswimming:
            result = NightSwimmingPalette()
        }
        return result
    }
}
class WhiteboardPalette: ColorPalette{
    fileprivate init(){
        super.init(backgroundColor: UIColor.white, textColor: UIColor.black)
    }
}
class BlackboardPalette: ColorPalette {
    fileprivate init(){
        super.init(backgroundColor: UIColor.black, textColor: UIColor.white)
    }
}
class MilkCoffeePalette: ColorPalette{
    fileprivate init(){
        super.init(backgroundColor: UIColor.brown, textColor: UIColor.white)
    }
}
class NightSwimmingPalette: ColorPalette{
    fileprivate init(){
        super.init(backgroundColor: UIColor(hex: 0x191970), textColor: UIColor.white)
    }
}
var label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 600, height: 44)))
label.textAlignment = .center

let whiteboardPalette = ColorPalette.make(theme: .whiteboard)
label.backgroundColor = whiteboardPalette.backgroundColor
label.textColor = whiteboardPalette.textColor
label.text = "Whiteboard Palette"

let blackboardPalette = ColorPalette.make(theme: .blackboard)
label.backgroundColor = blackboardPalette.backgroundColor
label.textColor = blackboardPalette.textColor
label.text = "Blackboard Palette"
