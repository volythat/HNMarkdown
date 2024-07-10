//
//  File.swift
//  
//
//  Created by oneweek02 on 5/11/23.
//

import UIKit
import Foundation
import Splash
import BonMot

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
            self.attributedText = self.setAttrParagraph2(text: "<q>" + item.content + "</q>")
        }else if item.type == .image {
            
        }else{
//            self.attributedText = self.setAttrParagraph(text: item.content)
            self.attributedText = self.setAttrParagraph2(text: item.content)
        }
        sizeToFit()
        
    }

    //MARK: - FUNC
    func setAttrParagraph2(text:String)->NSAttributedString?{

        let quote = StringStyle(
            .font(self.options.fontQuote),
            .color(self.options.colorTextQuote)
        )
        let boldStyle = StringStyle(
            .font(self.options.fontBold),
            .color(self.options.colorText)
        )
        let foreground = StringStyle(
            .font(self.options.fontCode),
            .color(self.options.colorText),
            .backgroundColor(self.options.blockBackground)
        )
        let italic = StringStyle(
            .font(self.options.fontItalic),
            .color(self.options.colorText)
        )
        let underline = StringStyle(
            .font(self.options.font),
            .color(self.options.colorText),
            .underline(.single, self.options.colorText)
        )
        let strike = StringStyle(
            .font(self.options.font),
            .color(self.options.colorText),
            .strikethrough(.single, self.options.colorText)
        )
        let header1 = StringStyle(
            .font(self.options.fontHeader1),
            .color(self.options.colorText)
        )
        let header2 = StringStyle(
            .font(self.options.fontHeader2),
            .color(self.options.colorText)
        )
        let header3 = StringStyle(
            .font(self.options.fontHeader3),
            .color(self.options.colorText)
        )
        let header4 = StringStyle(
            .font(self.options.fontHeader4),
            .color(self.options.colorText)
        )
        let header5 = StringStyle(
            .font(self.options.fontHeader5),
            .color(self.options.colorText)
        )
        let header6 = StringStyle(
            .font(self.options.fontHeader6),
            .color(self.options.colorText)
        )
        
        let baseStyle = StringStyle(
            .font(self.options.font),
            .color(self.options.colorText),
            .xmlRules([
                .style("b", boldStyle),
                .style("f", foreground),
                .style("i", italic),
                .style("u", underline),
                .style("s", strike),
                .style("q", quote),
                .style("h1", header1),
                .style("h2", header2),
                .style("h3", header3),
                .style("h4", header4),
                .style("h5", header5),
                .style("h6", header6)
            ])
        )
        // We can render our string
        return text.styled(with: baseStyle)
    }
    

    func setAttrCode(text:String)->NSAttributedString?{
        let highlighter = SyntaxHighlighter(format: AttributedStringOutputFormat(theme: options.themeForCode))
        return highlighter.highlight(text)
    }
    //MARK: - ACTION

}
