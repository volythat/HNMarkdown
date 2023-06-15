//
//  File.swift
//  
//
//  Created by oneweek02 on 6/15/23.
//

import UIKit
import Foundation
import Splash
import SwiftRichString

class HNBlockQuoteLabel : UIView {
    var label : HNBlockCodeLabel? = nil
    var viewLine : UIView?
    var item : HNMarkDownItem?
    var options = HNMarkdownOption()

    
    //MARK: - SETUP
    func setUp(item:HNMarkDownItem,options:HNMarkdownOption){
        self.item = item
        self.options = options
        
        if label == nil {
            self.label = HNBlockCodeLabel(frame: .zero)
            self.addSubview(self.label!)
            self.label?.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview()
            }
            self.label?.setUp(item: item , options: options)
        }
        addLine()
    }

    func addLine(){
        if viewLine == nil {
            viewLine = UIView(frame: .zero)
            viewLine?.backgroundColor = options.codeBackground
            self.addSubview(viewLine!)
            viewLine?.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(4)
            }
        }
    }
    //MARK: - FUNC
    
    

    //MARK: - ACTION

}
