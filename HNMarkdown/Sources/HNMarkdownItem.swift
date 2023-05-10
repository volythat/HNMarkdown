//
//  HNMarkdownItem.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import UIKit
import Foundation
import Markdown
import SwiftRichString


class HNMarkDownItem {
    var type : HNMarkDownType = .text
    var content : String = ""
    
    init(type: HNMarkDownType, content: String) {
        self.type = type
        self.content = content
    }
    
    func getHeight(width:CGFloat,font:UIFont)->CGFloat {
        return content.height(withConstrainedWidth: width , font: font)
    }
    
}
