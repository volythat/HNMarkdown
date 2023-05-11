//
//  File.swift
//  
//
//  Created by oneweek02 on 5/11/23.
//

import UIKit
import Foundation
import SwiftRichString
import Splash

class HNBlockCodeLabel : HNParagraphLabel {
    
    var item : HNMarkDownItem?
    var options = HNMarkdownOption()

    
    //MARK: - SETUP
    func setUp(item:HNMarkDownItem,options:HNMarkdownOption){
        numberOfLines = 0
        isUserInteractionEnabled = true 
        self.item = item
        self.options = options
        if item.type == .code {
            contentInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            self.attributedText = self.setAttrCode(text: item.content)
            createCopyButton()
        }else{
            contentInsets = .zero
            self.attributedText = self.setAttrParagraph(text: item.content)
        }
        sizeToFit()
    }
    func createCopyButton(){
        let btn = UIButton(frame: CGRect(x: frame.width - 40, y: 0, width: 40, height: 40))
        btn.setImage(self.options.copyImage, for: .normal)
        btn.setImage(self.options.copyDoneImage, for: .selected)
        btn.tintColor = self.options.tintColorCopyButton
        btn.addTarget(self , action: #selector(self.selectedCopyButton(_:)), for: .touchUpInside)
        self.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    //MARK: - FUNC
    func setAttrParagraph(text:String)->NSMutableAttributedString?{
        // The base style is applied to the entire string
        let baseStyle = Style {
            $0.font = self.options.font
            $0.lineSpacing = 1
        }

        let boldStyle = Style {
            $0.font = self.options.fontBold
            $0.dynamicText = DynamicText {
            $0.style = .body
            $0.maximumSize = 35.0
            $0.traitCollection = UITraitCollection(userInterfaceIdiom: .phone)
            }
        }
        let foreground: Style = Style {
            $0.font = self.options.fontCode
            $0.color = self.options.color
            $0.backColor = self.options.codeBackground
        }
        let italic: Style = Style {
            $0.font = self.options.fontItalic
        }
        let underline: Style = Style {
            $0.font = self.options.font
            $0.underline = (.single, self.options.color)
        }
        let header1: Style = Style {
            $0.font = self.options.fontHeader1
        }
        let header2: Style = Style {
            $0.font = self.options.fontHeader2
        }
        let header3: Style = Style {
            $0.font = self.options.fontHeader3
        }
        let header4: Style = Style {
            $0.font = self.options.fontHeader4
        }
        let header5: Style = Style {
            $0.font = self.options.fontHeader5
        }
        let header6: Style = Style {
            $0.font = self.options.fontHeader6
        }
        // A group container includes all the style defined.
        let groupStyle = StyleXML.init(base: baseStyle, ["b" : boldStyle,
                                                         "f": foreground,
                                                         "i":italic,
                                                         "u":underline,
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
        let highlighter = SyntaxHighlighter(format: AttributedStringOutputFormat(theme: .sunset(withFont: Font(size:self.options.fontSize))))
        return highlighter.highlight(text)
    }
    //MARK: - ACTION
    @objc func selectedCopyButton(_ sender:UIButton){
        UIPasteboard.general.string = item?.content ?? ""
        print("copied content to clipboard!")
        sender.animationCopyButton()
    }
}
