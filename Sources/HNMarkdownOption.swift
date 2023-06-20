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
    public var fontSize : CGFloat = 13
    public var font : UIFont {
        get {
            return UIFont.systemFont(ofSize: fontSize)
        }
        set {}
    }
    public var fontBold : UIFont {
        get {
            return UIFont.boldSystemFont(ofSize: fontSize)
        }
        set {}
    }
    public var fontItalic : UIFont {
        get {
            return UIFont.italicSystemFont(ofSize: fontSize)
        }
        set {}
    }
    
    public var fontHeader6 = UIFont.boldSystemFont(ofSize: 16)
    public var fontHeader5 = UIFont.boldSystemFont(ofSize: 18)
    public var fontHeader4 = UIFont.boldSystemFont(ofSize: 20)
    public var fontHeader3 = UIFont.boldSystemFont(ofSize: 22)
    public var fontHeader2 = UIFont.boldSystemFont(ofSize: 24)
    public var fontHeader1 = UIFont.boldSystemFont(ofSize: 26)
    
    public var fontCode : UIFont {
        get {
            return HNFont.SpaceMonoRegular.size(fontSize - 1)
        }
        set {}
    }
    public var codeBackground = UIColor(named: "bgBlockCode",in: Bundle.module, compatibleWith: nil)!
    public var colorText = UIColor(named: "defaultColorText",in: Bundle.module, compatibleWith: nil)!
    
    public var fontQuote : UIFont {
        get {
            return HNFont.SpaceMonoRegular.size(fontSize)
        }
        set {}
    }
    public var colorTextQuote : UIColor {
        get {
            return colorText.withAlphaComponent(0.9)
        }
        set {}
    }
    public var copyImage = UIImage(systemName: "doc.on.doc")
    public var copyDoneImage = UIImage(systemName: "checkmark")
    public var tintColorCopyButton = UIColor(named: "tintColorCopyButton",in: Bundle.module, compatibleWith: nil)
    public var padding : CGFloat = 16
    public var allowDarkmode : Bool = false
    public var thematicBreakColor = UIColor(named: "bgLineBreak",in: Bundle.module, compatibleWith: nil)
    public var placeholderImageView = UIImage(named: "img_placeholder_default", in: Bundle.module, with: nil)
    public var bgImageView = UIColor(named: "bgImageView",in: Bundle.module,compatibleWith: nil)
    
    public func themeForCode()->Theme {
        return Theme(
            font: Font(size: self.fontSize),
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
    
    public init() {}
}

