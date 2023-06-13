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
    var isDebug : Bool = false
    let padding : CGFloat = 16
    var content : String = ""
    public var options : HNMarkdownOption = HNMarkdownOption()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func setUp(markdownText:String,isDebug:Bool = false ){
        self.isDebug = isDebug
        self.content = ""
        subviews.forEach { v in
            v.removeFromSuperview()
        }
        HNFont.SpaceMonoRegular.register()
        let document = Document(parsing: markdownText)
        items = []
        
        
        document.children.forEach { mark in
//            logDebug("mark = \(mark.debugDescription(options: .printEverything))")
            self.addItems(mark: mark)
        }
        if !content.isEmpty {
            let item = HNMarkDownItem(type:.text,content: content)
            self.items.append(item)
            content = ""
        }
        self.addItemViews()
    }
    
    func getFormat(mark:Markup){
        if mark.childCount > 0 {
            mark.children.forEach { child in
                self.addItems(mark: child)
            }
        }else{
            self.addItems(mark: mark)
        }
    }
    
    func addItems(mark:Markup){
        var type = HNMarkDownType.text
        if let code = mark as? CodeBlock {
            self.addItemText()
            content = ""
            type = .code
            
            let item = HNMarkDownItem(type:type,content: code.code)
            self.items.append(item)
        }else if let header = mark as? Heading {
            self.addItemText()
            
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
            self.addItemText()
            
            type = .code
            let text = table.format().trimmingCharacters(in: .whitespacesAndNewlines)
            let item = HNMarkDownItem(type:type,content: text)
            self.items.append(item)
        }else{
            type = .text
            var isAdded = false
            
            mark.children.forEach { child in
                logDebug("child = \(child.debugDescription(options: .printEverything))")
                
                let fm = child.getFormat()
                if fm.isImage {
                    self.addItemText()
                    
                    isAdded = true
                    let item = HNMarkDownItem(type:.image,content: fm.text)
                    self.items.append(item)
                    
                }else{
                    isAdded = true
                    content += fm.text
                }
                    
                
            }
            if !isAdded {
                content += mark.format(options: .init(orderedListNumerals: .incrementing(start: 1)))
            }
        }
    }
    
    func addItemText(){
        if !content.isEmpty {
            let item = HNMarkDownItem(type:.text,content: content)
            self.items.append(item)
            content = ""
        }
    }
    
    func addItemViews(){
        var topView : UIView? = nil
        for (index,item) in items.enumerated() {
            let label = HNMarkdownItemView()
            label.setUp(item: item,options: self.options)
            self.addSubview(label)
            let topOffset : CGFloat = self.options.padding
            label.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(self.options.padding)
                make.trailing.equalToSuperview().offset(-self.options.padding)
                if let top = topView {
                    make.top.equalTo(top.snp.bottom).offset(topOffset)
                }else{
                    make.top.equalToSuperview().offset(topOffset)
                }
                if index == items.count - 1 {
                    make.bottom.equalToSuperview().offset(-self.options.padding)
                }
            }
            
            topView = label
        }
        
    }
    
    func animationAppear(){
        alpha = 0
        UIView.animate(withDuration: 1.2) {
            self.alpha = 1
        }
    }
    
}

