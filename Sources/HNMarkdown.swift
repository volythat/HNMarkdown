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
import SnapKit

public class HNMarkdown : UIView {
    
    var items : [HNMarkDownItem] = []
    
    let padding : CGFloat = 16
    public var options : HNMarkdownOption = HNMarkdownOption()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func setUp(markdownText:String){
        animationAppear()
        subviews.forEach { v in
            v.removeFromSuperview()
        }
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
                
                if !str.isEmpty {
                    let item = HNMarkDownItem(type:.text,content: str)
                    self.items.append(item)
                }
                str = ""
                type = .code
                let text = table.format().trimmingCharacters(in: .whitespacesAndNewlines)
                let item = HNMarkDownItem(type:type,content: text)
                self.items.append(item)
            }else{
                type = .text
                var isAdded = false
                mark.children.forEach { child in
                    if child is Emphasis {
                        isAdded = true
                        str += child.format().removeElement(element: .italic)
                    }else if child is Strong {
                        isAdded = true
                        str += child.format().removeElement(element: .bold)
                    }else if child is Strikethrough {
                        isAdded = true
                        str += child.format().removeElement(element: .strikethrough)
                    }else if child is InlineCode {
                        isAdded = true
                        str += child.format().removeElement(element: .inlinecode)
                    }else if child is Text {
                        isAdded = true
                        str += child.format()
                    }
                }
                if !isAdded {
                    str += mark.format(options: .init(orderedListNumerals: .incrementing(start: 1)))
                }
            }
        }
        if !str.isEmpty {
            let item = HNMarkDownItem(type:.text,content: str)
            self.items.append(item)
            str = ""
        }
        self.addItemViews()
    }
    
    func addItemViews(){
        var topView : UIView? = nil
        for (index,item) in items.enumerated() {
            let label = HNBlockCodeLabel()
            label.setUp(item: item,options: self.options)
            self.addSubview(label)
            
            label.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(self.options.padding)
                make.trailing.equalToSuperview().offset(-self.options.padding)
                if let top = topView {
                    make.top.equalTo(top.snp.bottom).offset(self.options.padding)
                }else{
                    make.top.equalToSuperview().offset(self.options.padding)
                }
                if index == items.count - 1 {
                    make.bottom.equalToSuperview().offset(-self.options.padding)
                }
            }
            if item.type == .code {
                self.addBackground(block: label)
            }
            topView = label
        }
        
    }
    
    func addBackground(block:UIView){
        let bg = UIView(frame: .zero)
        bg.backgroundColor = options.codeBackground
        bg.layer.cornerRadius = 8
        bg.layer.masksToBounds = true
        self.addSubview(bg)
        bg.snp.makeConstraints { make in
            make.top.equalTo(block).offset(-8)
            make.bottom.equalTo(block).offset(8)
            make.leading.equalTo(block).offset(-8)
            make.trailing.equalTo(block).offset(8)
        }
        self.bringSubviewToFront(block)
    }
    
    func animationAppear(){
        alpha = 0
        UIView.animate(withDuration: 1.2) {
            self.alpha = 1
        }
    }
    
}

