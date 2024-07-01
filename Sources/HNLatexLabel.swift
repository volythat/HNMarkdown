//
//  File.swift
//  
//
//  Created by TrungOW on 24/6/24.
//

import Foundation
import UIKit
import SwiftMath

class HNLatexLabel : UIView {
    
    var label : MTMathUILabel = MTMathUILabel()
    
    var item : HNMarkDownItem!
    var options : HNMarkdownOption!
    
    init(item: HNMarkDownItem, options: HNMarkdownOption) {
        super.init(frame: .zero)
        self.item = item
        self.options = options
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - SETUP
    func setUp(){
        isUserInteractionEnabled = true
        backgroundColor = .clear
        
        self.addLabel(text: item.content, textColor: options.colorText)
    }
    
    func addLabel(text:String,textColor:UIColor){
        self.label = MTMathUILabel()
        self.label.latex = text
        self.label.textColor = textColor
        
        self.addSubview(self.label)
        self.label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
