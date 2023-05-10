//
//  HNMarkdownOption.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import Foundation
import UIKit

public class HNMarkdownOption {
    var fontSize : CGFloat = 14
    var font : UIFont {
        get {
            return UIFont.systemFont(ofSize: fontSize)
        }
    }
    var fontBold : UIFont {
        get {
            return UIFont.boldSystemFont(ofSize: fontSize)
        }
    }
    var fontItalic : UIFont {
        get {
            return UIFont.italicSystemFont(ofSize: fontSize)
        }
    }
    
    var fontHeader6 = UIFont.boldSystemFont(ofSize: 16)
    var fontHeader5 = UIFont.boldSystemFont(ofSize: 18)
    var fontHeader4 = UIFont.boldSystemFont(ofSize: 20)
    var fontHeader3 = UIFont.boldSystemFont(ofSize: 22)
    var fontHeader2 = UIFont.boldSystemFont(ofSize: 24)
    var fontHeader1 = UIFont.boldSystemFont(ofSize: 26)
    
    var fontCode : UIFont {
        get {
            return HNFont.SpaceMonoRegular.size(fontSize)
        }
    }
    var codeBackground = UIColor(hexString: "#F4F7F9")
    var color = UIColor(hexString: "#000000")
    var copyImage = UIImage(systemName: "doc.on.doc")
    var copyDoneImage = UIImage(systemName: "checkmark")
    var tintColorCopyButton = UIColor.darkGray
}

