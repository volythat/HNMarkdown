//
//  File.swift
//  
//
//  Created by oneweek02 on 5/11/23.
//

import UIKit
import Foundation
import Splash
import SwiftRichString

class HNBlockCodeLabel : UITextView {
    
    var item : HNMarkDownItem?
    var options = HNMarkdownOption()

    
    //MARK: - SETUP
    func setUp(item:HNMarkDownItem,options:HNMarkdownOption){
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
        self.item = item
        self.options = options
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
            $0.lineSpacing = 1
        }
        let quote = Style {
            $0.font = self.options.fontQuote
            $0.color = self.options.colorTextQuote
        }

        let boldStyle = Style {
            $0.font = self.options.fontBold
            $0.color = self.options.colorText
            $0.dynamicText = DynamicText {
            $0.style = .body
            $0.maximumSize = 35.0
            $0.traitCollection = UITraitCollection(userInterfaceIdiom: .phone)
            }
        }
        let foreground: Style = Style {
            $0.font = self.options.fontCode
            $0.color = self.options.colorText
            $0.backColor = self.options.codeBackground
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
        // A group container includes all the style defined.
        let groupStyle = StyleXML.init(base: baseStyle, ["b" : boldStyle,
                                                         "f": foreground,
                                                         "i":italic,
                                                         "u":underline,
                                                         "q":quote,
                                                         "h1":header1,
                                                         "h2":header2,
                                                         "h3":header3,
                                                         "h4":header4,
                                                         "h5":header5,
                                                         "h6":header6])

        // We can render our string
        return text.set(style: groupStyle)
    }
    

    func setAttrCode(text:String)->NSAttributedString?{
        let highlighter = SyntaxHighlighter(format: AttributedStringOutputFormat(theme: options.themeForCode()))
        return highlighter.highlight(text)
    }
    //MARK: - ACTION

}
