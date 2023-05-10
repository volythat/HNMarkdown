//
//  HNMarkdownOption.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import Foundation
import UIKit

public class HNMarkdownOption {
    public var fontSize : CGFloat = 14
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
            return HNFont.SpaceMonoRegular.size(fontSize)
        }
        set {}
    }
    public var codeBackground = UIColor(hexString: "#F4F7F9")
    public var color = UIColor(hexString: "#000000")
    public var copyImage = UIImage(systemName: "doc.on.doc")
    public var copyDoneImage = UIImage(systemName: "checkmark")
    public var tintColorCopyButton = UIColor.darkGray
    
    public init() {}
}

