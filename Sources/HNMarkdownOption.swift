//
//  HNMarkdownOption.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import Foundation
import UIKit
import Splash

public class HNMarkdownOption {
    public var fontSize : CGFloat = 15
    public var fontName : String = "HelveticaNeue"
    
    var font : UIFont {
        get {
            return UIFont.fontRegular(fontName, size: fontSize)
        }
    }
    var fontBold : UIFont  {
        get {
            return UIFont.fontBold(fontName, size: fontSize)
        }
    }
    var fontItalic : UIFont  {
        get {
            return UIFont.fontBold(fontName, size: fontSize)
        }
    }
    
    var fontHeader6 : UIFont {
        get {
            return fontBold.withSize(fontSize + 1)
        }
    }
    var fontHeader5 : UIFont {
        get {
            return fontBold.withSize(fontSize + 4)
        }
    }
    var fontHeader4 : UIFont {
        get {
            return fontBold.withSize(fontSize + 5)
        }
    }
    var fontHeader3 : UIFont {
        get {
            return fontBold.withSize(fontSize + 7)
        }
    }
    var fontHeader2 : UIFont {
        get {
            return fontBold.withSize(fontSize + 9)
        }
    }
    var fontHeader1 : UIFont {
        get {
            return fontBold.withSize(fontSize + 11)
        }
    }
    public var fontQuote : UIFont = UIFont.monospacedSystemFont(ofSize: 15, weight: .regular)
    public var fontCode : UIFont = UIFont.monospacedSystemFont(ofSize: 15, weight: .regular)
    public var fontLink : UIFont = UIFont.monospacedSystemFont(ofSize: 15, weight: .regular)
    
    
    public var blockBackground = UIColor(named: "bgBlockCode",in: Bundle.module, compatibleWith: nil)!
    public var codeBackground = UIColor(named: "bgBlockCode",in: Bundle.module, compatibleWith: nil)!
    public var codeHeaderBackground = UIColor(named: "bgHeaderBlockCode",in: Bundle.module, compatibleWith: nil)!
    public var lineBlockCodeBackground = UIColor(named: "bgLineBreak",in: Bundle.module, compatibleWith: nil)!
    public var colorText = UIColor(named: "defaultColorText",in: Bundle.module, compatibleWith: nil)!
    
    var colorTextQuote : UIColor {
        get {
            return colorText.withAlphaComponent(0.9)
        }
    }
    
    public var copyImage = UIImage(named: "file_copy", in: Bundle.module, with: nil)
    public var copyDoneImage = UIImage(systemName: "checkmark")
    public var tintColorCopyButton = UIColor(named: "tintColorCopyButton",in: Bundle.module, compatibleWith: nil)
    public var padding : CGFloat = 16
    public var allowDarkmode : Bool = false
    public var thematicBreakColor = UIColor(named: "bgLineBreak",in: Bundle.module, compatibleWith: nil)
    public var placeholderImageView = UIImage(named: "img_placeholder_default", in: Bundle.module, with: nil)
    public var bgImageView = UIColor(named: "bgImageView",in: Bundle.module,compatibleWith: nil)
    
    public var tableTextAlignment : NSTextAlignment = .center
    public var colorBorderTable = UIColor(named: "colorBorderTable",in: Bundle.module,compatibleWith: nil)!
    
    public var themeForCode : Theme {
        return Theme(
            font: Font(size: self.fontSize - 1),
            plainTextColor: self.colorText,
            tokenColors: [
                .keyword: Color(named: "colorKeyword", in: Bundle.module, compatibleWith: nil)!,
                .string: Color(named: "colorString", in: Bundle.module, compatibleWith: nil)!,
                .type: Color(named: "colorType", in: Bundle.module, compatibleWith: nil)!,
                .call: Color(named: "colorCall", in: Bundle.module, compatibleWith: nil)!,
                .number: Color(named: "colorNumber", in: Bundle.module, compatibleWith: nil)!,
                .comment: Color(named: "colorCommend", in: Bundle.module, compatibleWith: nil)!,
                .property: Color(named: "colorProperty", in: Bundle.module, compatibleWith: nil)!,
                .dotAccess: Color(named: "colorDotAccess", in: Bundle.module, compatibleWith: nil)!,
                .preprocessing: Color(named: "colorPreProcessing", in: Bundle.module, compatibleWith: nil)!
            ],
            backgroundColor: self.codeBackground
        )
    }
    public var widthContentView : CGFloat = 0
    public var minHeightOfTableCell : CGFloat = 30
    public var turnOnLatex : Bool = false 
    
    
    public init(widthView:CGFloat){
        self.widthContentView = widthView
    }
}

