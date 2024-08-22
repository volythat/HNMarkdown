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
import Splash
import Markdown
import SnapKit


public class HNMarkdown : UIView {
    
    var items : [HNMarkDownItem] = []
    var isDebug : Bool = false
    var content : String = ""
    public var options : HNMarkdownOption!
    
    public var didSelectedLink : ((_ url:URL)->Void)?
    public var didSelectedImage : ((_ image:UIImage)->Void)?
    public var updatedHeight : (()->Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    public init(options:HNMarkdownOption){
        super.init(frame: .zero)
        self.options = options 
    }
    
    public func setUp(markdownText:String,isDebug:Bool = false ){
        self.isDebug = isDebug
        self.content = ""
        subviews.forEach { v in
            v.removeFromSuperview()
        }
        
        UIFont.register()
        let document = Document(parsing: markdownText)
        items = []
        
        
        document.children.forEach { mark in
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
        logDebug("mark = \(mark.debugDescription(options: .printEverything))")
        var type = HNMarkDownType.text
        if let code = mark as? CodeBlock {
            self.addItemText()
            content = ""
            type = .code
            
            let item = HNMarkDownItem(type:type,content: code.code)
            item.language = code.language ?? ""
            self.items.append(item)
        }else if mark is ThematicBreak {
            self.addItemText()
            content = ""
            type = .line
            let item = HNMarkDownItem(type:type,content: "")
            self.items.append(item)
        } else if let code = mark as? BlockQuote {
            self.addItemText()
            content = ""
            type = .quote
            var isAdded = false
            code.children.forEach { child in
//                logDebug("child = \(child.debugDescription(options: .printEverything))")
                
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
            let item = HNMarkDownItem(type:type,content: content)
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
            if mark.childCount > 0 {
                var str = ""
                mark.children.forEach { child in
                    
                    let fm = child.getFormat()
                    str += fm.text
                }
                
                let item = HNMarkDownItem(type:type,content: str.removeElement(element: element))
                self.items.append(item)
            }else{
                let text = mark.format().removeElement(element: element)
                let item = HNMarkDownItem(type:type,content: text)
                self.items.append(item)
            }
        }else if let table = mark as? Table {
            self.addItemText()
            
            type = .table
            let text = table.format().trimmingCharacters(in: .whitespacesAndNewlines)
            let item = HNMarkDownItem(type:type,content: text)
            item.head = table.head
            item.body = table.body
            self.items.append(item)
            
        }else if let order = mark as? UnorderedList {
            
            self.addItemText()
            var str = ""
            
            for (index,item) in order.listItems.enumerated() {
                type = .text
                item.children.forEach { child in
                    let fm = child.getFormat()
                    str += "- " + fm.text
                }
                
                if index < order.childCount - 1 {
                    str += "\n"
                }
            }
            let item = HNMarkDownItem(type:type,content: str)
            self.items.append(item)
            
        }else if let order = mark as? OrderedList {
            self.addItemText()
            var str = ""
            
            for (index,item) in order.listItems.enumerated() {
                type = .text
                item.children.forEach { child in
                    if child is UnorderedList {
                        str += child.getFormat().text
                    }else{
                        str += "\(index + 1). " + child.getFormat().text
                    }
                }
                
                if index < order.childCount - 1 {
                    str += "\n"
                }
            }
            let item = HNMarkDownItem(type:type,content: str)
            self.items.append(item)
            
        }else{
            type = .text
            var isAdded = false
            if mark is Paragraph {
                if !content.isEmpty {
                    content += "\n\n"
                }
            }
            
                mark.children.forEach { child in
//                    logDebug("hcild = \(child.getFormat().text)")
    //                logDebug("child = \(child.debugDescription(options: .printEverything))")

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
            if options.turnOnLatex {
                let result = content.extractLaTeXAndMarkdown()
                for item in result {
                    switch item {
                    case .paragraph(let paragraph):
                        //                    print("Paragraph:\n\(paragraph)\n")
                        let item = HNMarkDownItem(type:.text,content: paragraph)
                        self.items.append(item)
                    case .latex(let latex):
                        logDebug("latex = \(latex)")
                        let item = HNMarkDownItem(type:.latex,content: latex.removeFirstAndLastCharacter())
                        self.items.append(item)
                    }
                }
            }else{
                let item = HNMarkDownItem(type:.text,content: content)
                self.items.append(item)
            }
            content = ""
        }
    }
    
    func addItemViews(){
        var topView : UIView? = nil

        for (index,item) in items.enumerated() {
            if item.type == .line {
                let line = HNThematicBreak(frame: .zero)
                line.backgroundColor = options.thematicBreakColor
                self.addSubview(line)
                line.snp.makeConstraints { make in
                    make.leading.equalToSuperview().offset(self.options.padding)
                    make.trailing.equalToSuperview().offset(-self.options.padding)
                    make.height.equalTo(1)
                    if let top = topView {
                        make.top.equalTo(top.snp.bottom).offset(0)
                    }else{
                        make.top.equalToSuperview().offset(self.options.padding)
                    }
                    if index == items.count - 1 {
                        make.bottom.equalToSuperview().offset(-self.options.padding)
                    }
                }
                topView = line
            }else{
                let label = HNMarkdownItemView(options: self.options)
                self.addSubview(label)
                label.snp.makeConstraints { make in
                    make.leading.equalToSuperview().offset(self.options.padding)
                    make.trailing.equalToSuperview().offset(-self.options.padding)
                    
                    if let top = topView {
                        make.top.equalTo(top.snp.bottom).offset(0)
                    }else{
                        make.top.equalToSuperview().offset(self.options.padding)
                    }
                    if index == items.count - 1 {
                        make.bottom.equalToSuperview().offset(-self.options.padding)
                    }
                }
                label.setUp(item: item)
                
                label.didSelectedLink = { [weak self] url in
                    self?.didSelectedLink?(url)
                }
                label.didSelectedImage = {[weak self] image in
                    self?.didSelectedImage?(image)
                }
                label.updatedHeight = { [weak self] in
                    self?.updatedHeight?()
                }
                
                topView = label
            }
        }
        
    }
    
    func animationAppear(){
        alpha = 0
        UIView.animate(withDuration: 1.2) {
            self.alpha = 1
        }
    }
    
}

