//
//  HNMarkdown.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//
#if canImport(UIKit)

import UIKit

#endif

import Foundation
import SwiftRichString
import Splash
import Markdown

public class HNMarkdown : UIView {
    
    var items : [HNMarkDownItem] = []
    var contentHeight : CGFloat = 0
    let padding : CGFloat = 16
    var options : HNMarkdownOption = HNMarkdownOption()
    var widthView : CGFloat = 300
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func setUp(markdownText:String,width:CGFloat){
        self.widthView = width
        HNFont.SpaceMonoRegular.register()
        let document = Document(parsing: markdownText)
        items = []
        var str = ""
        var type = HNMarkDownType.text
        document.children.forEach { mark in
            print("mark = \(mark.debugDescription(options: .printEverything))")
            if mark is CodeBlock {
                if !str.isEmpty {
                    let item = HNMarkDownItem(type:.text,content: str)
                    self.items.append(item)
                }
                str = ""
                type = .code
                let text = mark.format().removeElement(element: .code)
                let item = HNMarkDownItem(type:type,content: text)
                self.items.append(item)
            }else if let header = mark as? Heading {
                if !str.isEmpty {
                    let item = HNMarkDownItem(type:.text,content: str)
                    self.items.append(item)
                }
                str = ""
                type = .text
                var element = HNSupportElements.header1
                if header.level == 2 {
                    element = .header2
                }else if header.level == 3 {
                    element = .header3
                }else if header.level == 4 {
                    element = .header4
                }else if header.level == 5 {
                    element = .header5
                }else if header.level == 6 {
                    element = .header6
                }
                let text = mark.format().removeElement(element: element)
                let item = HNMarkDownItem(type:type,content: text)
                self.items.append(item)
            }else if let table = mark as? Table {
                print("table = \(table.format())")
//                print("table = \(table.debugDescription(options: .printEverything))")
//                table.head.cells.forEach { cell in
//                    print("cell = \(cell.plainText)")
//                }
                type = .code
                str += table.format()
            }else{
                type = .text
                mark.children.forEach { child in
                    if child is Emphasis {
                        str += child.format().removeElement(element: .italic)
                    }else if child is Strong {
                        str += child.format().removeElement(element: .bold)
                    }else if child is Strikethrough {
                        str += child.format().removeElement(element: .strikethrough)
                    }else if child is InlineCode {
                        str += child.format().removeElement(element: .inlinecode)
                    }else{
                        str += child.format()
                    }
                }
            }
        }
        
        self.addItemViews()
    }
    
    func addItemViews(){
        var y = CGFloat(0)
        items.forEach { item in
            y += 8
            let h = item.getHeight(width: self.widthView - (self.padding * 2), font: self.options.font)
            let label = HNParagraphView(frame: CGRect(x: self.padding, y: y , width: self.widthView - (self.padding * 2), height: h))
            label.setUp(item: item,options: self.options, height: h)
            
            if item.type == .code {
                label.backgroundColor = self.options.codeBackground
                label.layer.cornerRadius = 8
                label.layer.masksToBounds = true
            }else{
                label.backgroundColor = .clear
            }
            self.addSubview(label)
            y += label.frame.size.height
        }
        self.contentHeight = y + 16
        self.updateHeightConstraint()
    }
    
    func updateHeightConstraint(){
        for con in self.constraints {
            if con.firstAttribute == NSLayoutConstraint.Attribute.height {
                con.constant = self.contentHeight
                break
            }
        }
    }
    
}

