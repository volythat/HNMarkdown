//
//  HNMarkdownItem.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import UIKit
import Foundation
import Markdown

class HNMarkDownItem {
    var type : HNMarkDownType = .text
    var content : String = ""
    var language : String = ""
    var head : Table.Head? = nil
    var body : Table.Body? = nil 
    
    init(type: HNMarkDownType, content: String) {
        self.type = type
        self.content = content
    }
    
    func getHeight(width:CGFloat,font:UIFont)->CGFloat {
        return content.height(withConstrainedWidth: width , font: font)
    }

}
