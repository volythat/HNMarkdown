//
//  File.swift
//  
//
//  Created by oneweek02 on 5/11/23.
//

import UIKit
import Foundation
import Splash

class HNBlockCodeLabel : UITextView {
    
    var item : HNMarkDownItem!
    var options : HNMarkdownOption!

    init(item: HNMarkDownItem, options: HNMarkdownOption) {
        super.init(frame: .zero, textContainer: nil)
        self.item = item
        self.options = options
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - SETUP
    func setUp(){
//        numberOfLines = 0
        isScrollEnabled = false
        isUserInteractionEnabled = true
        backgroundColor = .clear
        isEditable = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        self.textColor = options.colorText
        self.text = item.content
        self.font = options.font
        
        if item.type == .code {
            self.attributedText = self.setAttrCode(text: item.content)
        }else if item.type == .quote {
            self.attributedText = self.setAttrParagraph(text: "<q>" + item.content + "</q>")
        }else if item.type == .image {
            
        }else{
            self.attributedText = self.setAttrParagraph(text: item.content)
        }
        sizeToFit()

    }

    //MARK: - FUNC
    
    func setAttrParagraph(text:String)->NSMutableAttributedString?{
        // The base style is applied to the entire string
        let baseStyle = Style {
            $0.font = self.options.font
            $0.color = self.options.colorText
        }
        let quote = Style {
            $0.font = self.options.fontQuote
            $0.color = self.options.colorTextQuote
        }

        let boldStyle = Style {
            $0.font = self.options.fontBold
            $0.color = self.options.colorText
        }
        let foreground: Style = Style {
            $0.font = self.options.fontCode
            $0.color = self.options.colorText
            $0.backColor = self.options.blockBackground
        }
        let italic: Style = Style {
            $0.font = self.options.fontItalic
            $0.color = self.options.colorText
        }
        let underline: Style = Style {
            $0.font = self.options.font
            $0.color = self.options.colorText
            $0.underline = (.single, self.options.colorText)
        }
        let s: Style = Style {
            $0.font = self.options.font
            $0.color = self.options.colorText
            $0.strikethrough = (.single, self.options.colorText)
        }
        let header1: Style = Style {
            $0.font = self.options.fontHeader1
            $0.color = self.options.colorText
        }
        let header2: Style = Style {
            $0.font = self.options.fontHeader2
            $0.color = self.options.colorText
        }
        let header3: Style = Style {
            $0.font = self.options.fontHeader3
            $0.color = self.options.colorText
        }
        let header4: Style = Style {
            $0.font = self.options.fontHeader4
            $0.color = self.options.colorText
        }
        let header5: Style = Style {
            $0.font = self.options.fontHeader5
            $0.color = self.options.colorText
        }
        let header6: Style = Style {
            $0.font = self.options.fontHeader6
            $0.color = self.options.colorText
        }
        let a = Style {
            $0.font = self.options.fontLink
        }
        // A group container includes all the style defined.
        let groupStyle = StyleXML.init(base: baseStyle, ["b" : boldStyle,
                                                         "f": foreground,
                                                         "a": a,
                                                         "i":italic,
                                                         "u":underline,
                                                         "q":quote,
                                                         "s":s,
                                                         "h1":header1,
                                                         "h2":header2,
                                                         "h3":header3,
                                                         "h4":header4,
                                                         "h5":header5,
                                                         "h6":header6])

        
        return text.set(style: groupStyle)
    }

    func setAttrCode(text:String)->NSAttributedString?{
        let highlighter = SyntaxHighlighter(format: AttributedStringOutputFormat(theme: options.themeForCode))
        return highlighter.highlight(text)
    }
    //MARK: - ACTION

}
