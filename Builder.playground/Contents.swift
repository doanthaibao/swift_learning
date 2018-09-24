import UIKit

var str = "Hello, playground"
public class Theme {
    public let backgroundColor: UIColor
    public let textColor: UIColor
    public let font: UIFont
    public init(backgroundColor: UIColor, textColor: UIColor , font: UIFont){
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.font = font
    }
}
public class ThemeBuilder{
    public var backgroundColor = UIColor.white
    public var textColor = UIColor.black
    public var font = UIFont.systemFont(ofSize: 15)
    public init(){}
    public var theme: Theme {
        get{
            return Theme(backgroundColor: self.backgroundColor, textColor: self.textColor, font: self.font)
            
        }
    }
}
//let defaultTheme = Theme(backgroundColor: UIColor.white, textColor: UIColor.black,
//                         font: UIFont.systemFont(ofSize: 15))
//let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 800, height: 44)))
//label.backgroundColor = defaultTheme.backgroundColor
//label.textColor = defaultTheme.textColor
//label.font = defaultTheme.font
//label.text = "White background, black text, system font :15"
//
//let alertTheme = Theme(backgroundColor: UIColor.white, textColor: UIColor.red,
//                      font: UIFont.systemFont(ofSize: 15))
//
//label.textColor = alertTheme.textColor
//label.font = alertTheme.font
//label.text = "White background, red text, system font :15"

//let defaultTheme = Theme( textColor: UIColor.red)
//let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 800, height: 44)))
//label.backgroundColor = defaultTheme.backgroundColor
//label.textColor = defaultTheme.textColor
//label.font = defaultTheme.font
//label.text = "White background, black text, system font :15"

let themeBuilder = ThemeBuilder() //create new theme builder without parameters
let defaultTheme = themeBuilder.theme
let label = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 800, height: 44)))
label.backgroundColor = defaultTheme.backgroundColor
label.textColor = defaultTheme.textColor
label.font = defaultTheme.font
label.text = "White background, black text, system font :15"
//Change property of theme builder
themeBuilder.backgroundColor = UIColor.yellow
let yellowTheme = themeBuilder.theme
label.backgroundColor = yellowTheme.backgroundColor

